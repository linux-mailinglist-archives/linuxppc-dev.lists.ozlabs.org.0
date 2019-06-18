Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 166834A270
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2019 15:37:23 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45SpzK5YPTzDq8D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2019 23:37:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Spsh4pD9zDq9k
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jun 2019 23:32:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=neuling.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=neuling.org header.i=@neuling.org header.b="ldyXfBby"; 
 dkim-atps=neutral
Received: from neuling.org (localhost [127.0.0.1])
 by ozlabs.org (Postfix) with ESMTP id 45Spsd6Msdz9s7h;
 Tue, 18 Jun 2019 23:32:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=neuling.org;
 s=201811; t=1560864742;
 bh=fQzYQ/vuflfUUNAxzR7+ROE6ZXUaSKQy4rHVIV8oGxA=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=ldyXfBbyTU+UD8Q0MAcn6aH00wB+DRPZWFmnm7hOkgJMrDSOd69jTSYiMBlYF4bXY
 rytO/7MUJBJMkzCGbAGxe0l+dDH+dXHe2p8cxCHvfW5iT30n77ul+sEAmPV4m8IRG+
 KyBq5arPGAnFPq047r0oRtsANiDT/i5lL47T+Cy/R/haGaFVDujLsQiqYX6cRAEkeO
 h6fJRXLYQjjJ3khdoCQsSpA3TQz1L/HgfB4NXTCHCL9QVqzvNLEd2OJ5ZAhXNXjBHX
 viPNnQu3MRz9LenIgyMg+34l06MmZjP7kg9Qx/YX5UKPLb9ryYOZhIsQC4gABeDGAR
 bVvrhJS0Pc6Fw==
Received: by neuling.org (Postfix, from userid 1000)
 id BDF5C2A2538; Tue, 18 Jun 2019 23:32:21 +1000 (AEST)
Message-ID: <707bc0b664b8ebbb843a1541155fed219c216035.camel@neuling.org>
Subject: Re: [PATCH 5/5] Powerpc/Watchpoint: Fix length calculation for
 unaligned target
From: Michael Neuling <mikey@neuling.org>
To: Ravi Bangoria <ravi.bangoria@linux.ibm.com>, mpe@ellerman.id.au
Date: Tue, 18 Jun 2019 23:32:21 +1000
In-Reply-To: <20190618042732.5582-6-ravi.bangoria@linux.ibm.com>
References: <20190618042732.5582-1-ravi.bangoria@linux.ibm.com>
 <20190618042732.5582-6-ravi.bangoria@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
MIME-Version: 1.0
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linux-kernel@vger.kernel.org, npiggin@gmail.com, paulus@samba.org,
 naveen.n.rao@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2019-06-18 at 09:57 +0530, Ravi Bangoria wrote:
> Watchpoint match range is always doubleword(8 bytes) aligned on
> powerpc. If the given range is crossing doubleword boundary, we
> need to increase the length such that next doubleword also get
> covered. Ex,
>=20
>           address   len =3D 6 bytes
>                 |=3D=3D=3D=3D=3D=3D=3D=3D=3D.
>    |------------v--|------v--------|
>    | | | | | | | | | | | | | | | | |
>    |---------------|---------------|
>     <---8 bytes--->
>=20
> In such case, current code configures hw as:
>   start_addr =3D address & ~HW_BREAKPOINT_ALIGN
>   len =3D 8 bytes
>=20
> And thus read/write in last 4 bytes of the given range is ignored.
> Fix this by including next doubleword in the length. Watchpoint
> exception handler already ignores extraneous exceptions, so no
> changes required for that.

Nice catch. Thanks.

I assume this has been broken forever? Should we be CCing stable? If so, it
would be nice to have this self contained (separate from the refactor) so w=
e can
more easily backport it.

Also, can you update=20
tools/testing/selftests/powerpc/ptrace/ptrace-hwbreak.c to catch this issue=
?

A couple more comments below.

>=20
> Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/hw_breakpoint.h |  7 ++--
>  arch/powerpc/kernel/hw_breakpoint.c      | 44 +++++++++++++-----------
>  arch/powerpc/kernel/process.c            | 34 ++++++++++++++++--
>  3 files changed, 60 insertions(+), 25 deletions(-)
>=20
> diff --git a/arch/powerpc/include/asm/hw_breakpoint.h
> b/arch/powerpc/include/asm/hw_breakpoint.h
> index 8acbbdd4a2d5..749a357164d5 100644
> --- a/arch/powerpc/include/asm/hw_breakpoint.h
> +++ b/arch/powerpc/include/asm/hw_breakpoint.h
> @@ -34,6 +34,8 @@ struct arch_hw_breakpoint {
>  #define HW_BRK_TYPE_PRIV_ALL	(HW_BRK_TYPE_USER | HW_BRK_TYPE_KERNEL | \
>  				 HW_BRK_TYPE_HYP)
> =20
> +#define HW_BREAKPOINT_ALIGN 0x7
> +
>  #ifdef CONFIG_HAVE_HW_BREAKPOINT
>  #include <linux/kdebug.h>
>  #include <asm/reg.h>
> @@ -45,8 +47,6 @@ struct pmu;
>  struct perf_sample_data;
>  struct task_struct;
> =20
> -#define HW_BREAKPOINT_ALIGN 0x7
> -
>  extern int hw_breakpoint_slots(int type);
>  extern int arch_bp_generic_fields(int type, int *gen_bp_type);
>  extern int arch_check_bp_in_kernelspace(struct arch_hw_breakpoint *hw);
> @@ -76,7 +76,8 @@ static inline void hw_breakpoint_disable(void)
>  }
>  extern void thread_change_pc(struct task_struct *tsk, struct pt_regs *re=
gs);
>  int hw_breakpoint_handler(struct die_args *args);
> -
> +extern u16 hw_breakpoint_get_final_len(struct arch_hw_breakpoint *brk,
> +		unsigned long *start_addr, unsigned long *end_addr);
>  extern int set_dawr(struct arch_hw_breakpoint *brk);
>  extern bool dawr_force_enable;
>  static inline bool dawr_enabled(void)
> diff --git a/arch/powerpc/kernel/hw_breakpoint.c
> b/arch/powerpc/kernel/hw_breakpoint.c
> index 36bcf705df65..c122fd55aa44 100644
> --- a/arch/powerpc/kernel/hw_breakpoint.c
> +++ b/arch/powerpc/kernel/hw_breakpoint.c
> @@ -126,6 +126,28 @@ int arch_bp_generic_fields(int type, int *gen_bp_typ=
e)
>  	return 0;
>  }
> =20
> +/* Maximum len for DABR is 8 bytes and DAWR is 512 bytes */
> +static int hw_breakpoint_validate_len(struct arch_hw_breakpoint *hw)
> +{
> +	u16 length_max =3D 8;
> +	u16 final_len;
> +	unsigned long start_addr, end_addr;
> +
> +	final_len =3D hw_breakpoint_get_final_len(hw, &start_addr, &end_addr);
> +
> +	if (dawr_enabled()) {
> +		length_max =3D 512;
> +		/* DAWR region can't cross 512 bytes boundary */
> +		if ((start_addr >> 9) !=3D (end_addr >> 9))
> +			return -EINVAL;
> +	}
> +
> +	if (final_len > length_max)
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
>  /*
>   * Validate the arch-specific HW Breakpoint register settings
>   */
> @@ -133,12 +155,10 @@ int hw_breakpoint_arch_parse(struct perf_event *bp,
>  			     const struct perf_event_attr *attr,
>  			     struct arch_hw_breakpoint *hw)
>  {
> -	int length_max;
> -
>  	if (!ppc_breakpoint_available())
>  		return -ENODEV;
> =20
> -	if (!bp)
> +	if (!bp || !attr->bp_len)
>  		return -EINVAL;
> =20
>  	hw->type =3D HW_BRK_TYPE_TRANSLATE;
> @@ -160,23 +180,7 @@ int hw_breakpoint_arch_parse(struct perf_event *bp,
>  	hw->address =3D attr->bp_addr;
>  	hw->len =3D attr->bp_len;
> =20
> -	length_max =3D 8; /* DABR */
> -	if (dawr_enabled()) {
> -		length_max =3D 512 ; /* 64 doublewords */
> -		/* DAWR region can't cross 512 bytes boundary */
> -		if ((hw->address >> 9) !=3D ((hw->address + hw->len - 1) >> 9))
> -			return -EINVAL;
> -	}
> -
> -	/*
> -	 * Since breakpoint length can be a maximum of length_max and
> -	 * breakpoint addresses are aligned to nearest double-word
> -	 * HW_BREAKPOINT_ALIGN by rounding off to the lower address,
> -	 * the 'symbolsize' should satisfy the check below.
> -	 */
> -	if (hw->len > (length_max - (hw->address & HW_BREAKPOINT_ALIGN)))
> -		return -EINVAL;
> -	return 0;
> +	return hw_breakpoint_validate_len(hw);
>  }
> =20
>  /*
> diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.=
c
> index 265fac9fb3a4..159aaa70de46 100644
> --- a/arch/powerpc/kernel/process.c
> +++ b/arch/powerpc/kernel/process.c
> @@ -802,9 +802,39 @@ static int disable_dawr(void)
>  	return 0;
>  }
> =20
> +/*
> + * Watchpoint match range is always doubleword(8 bytes) aligned on
> + * powerpc. If the given range is crossing doubleword boundary, we
> + * need to increase the length such that next doubleword also get
> + * covered. Ex,
> + *
> + *          address   len =3D 6 bytes
> + *                |=3D=3D=3D=3D=3D=3D=3D=3D=3D.
> + *   |------------v--|------v--------|
> + *   | | | | | | | | | | | | | | | | |
> + *   |---------------|---------------|
> + *    <---8 bytes--->
> + *
> + * In this case, we should configure hw as:
> + *   start_addr =3D address & ~HW_BREAKPOINT_ALIGN
> + *   len =3D 16 bytes
> + *
> + * @start_addr and @end_addr are inclusive.
> + */
> +u16 hw_breakpoint_get_final_len(struct arch_hw_breakpoint *brk,
> +				unsigned long *start_addr,
> +				unsigned long *end_addr)

I don't really like this.  "final" is not a good name. Something like hardw=
are
would be better.

Also, can you put the start_addr and end addr in the arch_hw_breakpoint rat=
her
than doing what you have above.  Call them hw_start_addr, hw_end_addr.

We could even set these two new addresses where we set the set of
arch_hw_breakpoint rather than having this late call.

> +{
> +	*start_addr =3D brk->address & ~HW_BREAKPOINT_ALIGN;
> +	*end_addr =3D (brk->address + brk->len - 1) | HW_BREAKPOINT_ALIGN;
> +	return *end_addr - *start_addr + 1;
> +}
> +
>  int set_dawr(struct arch_hw_breakpoint *brk)
>  {
>  	unsigned long dawr, dawrx, mrd;
> +	unsigned long start_addr, end_addr;
> +	u16 final_len;
> =20
>  	if (brk->type =3D=3D HW_BRK_TYPE_DISABLE)
>  		return disable_dawr();
> @@ -815,8 +845,8 @@ int set_dawr(struct arch_hw_breakpoint *brk)
>  	dawrx |=3D ((brk->type & HW_BRK_TYPE_TRANSLATE) >> 2) << (63 - 59);
>  	dawrx |=3D (brk->type & HW_BRK_TYPE_PRIV_ALL) >> 3;
> =20
> -	/* brk->len is in bytes. */
> -	mrd =3D ((brk->len + 7) >> 3) - 1;
> +	final_len =3D hw_breakpoint_get_final_len(brk, &start_addr, &end_addr);

Again, hardware length, or something other than "final"

> +	mrd =3D ((final_len + 7) >> 3) - 1;
>  	dawrx |=3D (mrd & 0x3f) << (63 - 53);
> =20
>  	if (ppc_md.set_dawr)


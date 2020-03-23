Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 773DA18EFC7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 07:27:43 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48m4Dq1BzRzDqyB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 17:27:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=EyCJbl+o; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48m4Bf6bVyzDqdM
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 17:25:46 +1100 (AEDT)
Received: by mail-pg1-x544.google.com with SMTP id k191so5526823pgc.13
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Mar 2020 23:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=63jZMG0l4ncgOgYD5OgfCkSfHu/jGV21bCo5cARHtSA=;
 b=EyCJbl+obCAsLuYs2ZpxlRBqNpSy/CFdkEzvMuLpGB+Xg7qUU380Am8M38SPUmcX4h
 nItg3yatViJICytOKEuSQcl9ddAbvu7pWW0E1MsOjYdEDq2fFDQ7YCfnxudCjWglb91T
 xDgZAjE7AgD7rwPxHfqvSGQ1tmGo9Gdho9L2vCnSk4QJ7YeCrBuVPDw0DGoIhh03jRW2
 I9m4d0Q1TEi0wBflFN1ZAePDiNZSv0u4Pzpu3EiNmq33URQOTzIMjes64pTxsVjqbTqZ
 RK0u0LIcb1xNkvFERGC40DEn77BfrUGFhIf+e9Gog3BwUPmkgAWeszjUTYGepyrajHy1
 aoCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=63jZMG0l4ncgOgYD5OgfCkSfHu/jGV21bCo5cARHtSA=;
 b=cX6XnWqSv0gi/lNl2jmwJ0JRzN5WyQAfgujTnWcF7U/xKBJ3fw/lcrvhCpNlMcfkaz
 ATTicVnnXyAglcKgjJ1wpVEHm0XO4vJ1s9ifPTxQrRTWTXqiukWv86pTBZLlzS4aC7lR
 DHab4v4G2++bAAELELrzjWjNQ5mL564ae+9daY6YuQnZf+JvAfPxP/OLHutRYOZ3W0uh
 sqVme058JR3ns86ImC1tMNfMmLm1H5bC2X0G0N0xvKvS4YDsZwfyUF1N2tg6CJfkdLqn
 YcFyPhBgYktv2889nR2Hgw3Z6POqLNQ4o1Zd9JfmCTscRffYD7uC9WdBwW2l+9Y7Uc5n
 wzjg==
X-Gm-Message-State: ANhLgQ3vpa7okexFhHHwW1y7/scVXs30Rqw2enUwcRQZxEmL8AG7pSep
 Owl4CRZvJfIO+XpKk1E8ZvJRDYJq
X-Google-Smtp-Source: ADFU+vuTGBXLgbjprnYS1dcqndkwjUyoQzfTNyZ+Qed8107qjXvO5qBvPnO79uUftwCcSqX+lmJMsg==
X-Received: by 2002:a62:14d6:: with SMTP id 205mr23168385pfu.155.1584944743389; 
 Sun, 22 Mar 2020 23:25:43 -0700 (PDT)
Received: from localhost (14-202-190-183.tpgi.com.au. [14.202.190.183])
 by smtp.gmail.com with ESMTPSA id h132sm12495088pfe.118.2020.03.22.23.25.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Mar 2020 23:25:43 -0700 (PDT)
Date: Mon, 23 Mar 2020 16:22:01 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 02/16] xmon: Move out-of-line instructions to text
 section
To: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20200320051809.24332-1-jniethe5@gmail.com>
 <20200320051809.24332-3-jniethe5@gmail.com>
In-Reply-To: <20200320051809.24332-3-jniethe5@gmail.com>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1584944411.m7b83ykyti.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: alistair@popple.id.au, dja@axtens.net, bala24@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Jordan Niethe's on March 20, 2020 3:17 pm:
> To execute an instruction out of line after a breakpoint, the NIP is set
> to the address of struct bpt::instr. Here a copy of the instruction that
> was replaced with a breakpoint is kept, along with a trap so normal flow
> can be resumed after XOLing. The struct bpt's are located within the
> data section. This is problematic as the data section may be marked as
> no execute.
>=20
> Instead of each struct bpt holding the instructions to be XOL'd, make a
> new array, bpt_table[], with enough space to hold instructions for the
> number of supported breakpoints. Place this array in the text section.
> Make struct bpt::instr a pointer to the instructions in bpt_table[]
> associated with that breakpoint. This association is a simple mapping:
> bpts[n] -> bpt_table[n * words per breakpoint]. Currently we only need
> the copied instruction followed by a trap, so 2 words per breakpoint.
>=20
> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

> ---
> v4: New to series
> ---
>  arch/powerpc/kernel/vmlinux.lds.S |  2 +-
>  arch/powerpc/xmon/xmon.c          | 22 +++++++++++++---------
>  2 files changed, 14 insertions(+), 10 deletions(-)
>=20
> diff --git a/arch/powerpc/kernel/vmlinux.lds.S b/arch/powerpc/kernel/vmli=
nux.lds.S
> index b4c89a1acebb..e90845b8c300 100644
> --- a/arch/powerpc/kernel/vmlinux.lds.S
> +++ b/arch/powerpc/kernel/vmlinux.lds.S
> @@ -86,7 +86,7 @@ SECTIONS
>  		ALIGN_FUNCTION();
>  #endif
>  		/* careful! __ftr_alt_* sections need to be close to .text */
> -		*(.text.hot TEXT_MAIN .text.fixup .text.unlikely .fixup __ftr_alt_* .r=
ef.text);
> +		*(.text.hot TEXT_MAIN .text.fixup .text.unlikely .fixup __ftr_alt_* .r=
ef.text .text.xmon_bpts);
>  #ifdef CONFIG_PPC64
>  		*(.tramp.ftrace.text);
>  #endif
> diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
> index 02e3bd62cab4..7875d1a37770 100644
> --- a/arch/powerpc/xmon/xmon.c
> +++ b/arch/powerpc/xmon/xmon.c
> @@ -97,7 +97,7 @@ static long *xmon_fault_jmp[NR_CPUS];
>  /* Breakpoint stuff */
>  struct bpt {
>  	unsigned long	address;
> -	unsigned int	instr[2];
> +	unsigned int	*instr;
>  	atomic_t	ref_count;
>  	int		enabled;
>  	unsigned long	pad;
> @@ -109,6 +109,7 @@ struct bpt {
>  #define BP_DABR		4
> =20
>  #define NBPTS	256
> +#define BPT_WORDS	2
>  static struct bpt bpts[NBPTS];
>  static struct bpt dabr;
>  static struct bpt *iabr;
> @@ -116,6 +117,8 @@ static unsigned bpinstr =3D 0x7fe00008;	/* trap */
> =20
>  #define BP_NUM(bp)	((bp) - bpts + 1)
> =20
> +static unsigned int __section(.text.xmon_bpts) bpt_table[NBPTS * BPT_WOR=
DS];
> +
>  /* Prototypes */
>  static int cmds(struct pt_regs *);
>  static int mread(unsigned long, void *, int);
> @@ -852,16 +855,16 @@ static struct bpt *at_breakpoint(unsigned long pc)
>  static struct bpt *in_breakpoint_table(unsigned long nip, unsigned long =
*offp)
>  {
>  	unsigned long off;
> +	unsigned long bp_off;
> =20
> -	off =3D nip - (unsigned long) bpts;
> -	if (off >=3D sizeof(bpts))
> +	off =3D nip - (unsigned long) bpt_table;
> +	if (off >=3D sizeof(bpt_table))
>  		return NULL;
> -	off %=3D sizeof(struct bpt);
> -	if (off !=3D offsetof(struct bpt, instr[0])
> -	    && off !=3D offsetof(struct bpt, instr[1]))
> +	bp_off =3D off % (sizeof(unsigned int) * BPT_WORDS);
> +	if (bp_off !=3D 0 && bp_off !=3D 4)
>  		return NULL;
> -	*offp =3D off - offsetof(struct bpt, instr[0]);
> -	return (struct bpt *) (nip - off);
> +	*offp =3D bp_off;
> +	return bpts + ((off - bp_off) / (sizeof(unsigned int) * BPT_WORDS));
>  }
> =20
>  static struct bpt *new_breakpoint(unsigned long a)
> @@ -876,7 +879,8 @@ static struct bpt *new_breakpoint(unsigned long a)
>  	for (bp =3D bpts; bp < &bpts[NBPTS]; ++bp) {
>  		if (!bp->enabled && atomic_read(&bp->ref_count) =3D=3D 0) {
>  			bp->address =3D a;
> -			patch_instruction(&bp->instr[1], bpinstr);
> +			bp->instr =3D bpt_table + ((bp - bpts) * BPT_WORDS);
> +			patch_instruction(bp->instr + 1, bpinstr);
>  			return bp;
>  		}
>  	}
> --=20
> 2.17.1
>=20
>=20
=

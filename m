Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9545C7F1DEF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Nov 2023 21:21:54 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lWdjD+3r;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SYzSJ3N2nz3dTS
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Nov 2023 07:21:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lWdjD+3r;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=aneesh.kumar@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SYgDS3JpQz3bWQ
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Nov 2023 19:10:32 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5AC9860E33;
	Mon, 20 Nov 2023 08:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74987C433C7;
	Mon, 20 Nov 2023 08:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700467829;
	bh=SjRZF2cakItqyiN0PclchRbloFvSusbdkUMvxpRBn2s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=lWdjD+3r15xJtDpe0M3jJdsZQY7cOd9MA1jsIQ7XaYuSBm46Zij6hBFran7RtU9l1
	 fKezTLncu7Wd2WeGND2vsYMellmK8tSLIo04Wcy13Uk6f75TH/0yHLwgbafX1tZe1Q
	 IVnZM2RL3jLAIjZ6H9mOmaox4FbDToRfbRCllthlwQwGawQZnvmEwh7MQcuphU7VFl
	 xXA/qMy1HkIqy2imWZWz4daEFeoPPrVf7kXMDHv2hIex6x5gmXH0ZPCz66mfKlxC3g
	 18MxMpdZpgD6GpVZPeLMwPzYn8MxwfZ57Dacyl2FzN8MRQsgsYBY5Qzk6Vz8I0GddO
	 AFVHKH454A+sQ==
X-Mailer: emacs 29.1 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V (IBM) <aneesh.kumar@kernel.org>
To: Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 05/13] powerpc/rtas: Facilitate high-level call
 sequences
In-Reply-To: <20231117-papr-sys_rtas-vs-lockdown-v4-5-b794d8cb8502@linux.ibm.com>
References: <20231117-papr-sys_rtas-vs-lockdown-v4-0-b794d8cb8502@linux.ibm.com>
 <20231117-papr-sys_rtas-vs-lockdown-v4-5-b794d8cb8502@linux.ibm.com>
Date: Mon, 20 Nov 2023 13:40:22 +0530
Message-ID: <878r6slua9.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 21 Nov 2023 07:17:50 +1100
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, tyreld@linux.ibm.com, Michal =?utf-8?Q?Such=C3=A1nek?= <msuchanek@suse.de>, linuxppc-dev@lists.ozlabs.org, gcwilson@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
writes:

> From: Nathan Lynch <nathanl@linux.ibm.com>
>
> On RTAS platforms there is a general restriction that the OS must not
> enter RTAS on more than one CPU at a time. This low-level
> serialization requirement is satisfied by holding a spin
> lock (rtas_lock) across most RTAS function invocations.
>
> However, some pseries RTAS functions require multiple successive calls
> to complete a logical operation. Beginning a new call sequence for such a
> function may disrupt any other sequences of that function already in
> progress. Safe and reliable use of these functions effectively
> requires higher-level serialization beyond what is already done at the
> level of RTAS entry and exit.
>
> Where a sequence-based RTAS function is invoked only through
> sys_rtas(), with no in-kernel users, there is no issue as far as the
> kernel is concerned. User space is responsible for appropriately
> serializing its call sequences. (Whether user space code actually
> takes measures to prevent sequence interleaving is another matter.)
> Examples of such functions currently include ibm,platform-dump and
> ibm,get-vpd.
>
> But where a sequence-based RTAS function has both user space and
> in-kernel uesrs, there is a hazard. Even if the in-kernel call sites
> of such a function serialize their sequences correctly, a user of
> sys_rtas() can invoke the same function at any time, potentially
> disrupting a sequence in progress.
>
> So in order to prevent disruption of kernel-based RTAS call sequences,
> they must serialize not only with themselves but also with sys_rtas()
> users, somehow. Preferably without adding global locks or adding more
> function-specific hacks to sys_rtas(). This is a prerequisite for
> adding an in-kernel call sequence of ibm,get-vpd, which is in a change
> to follow.
>
> Note that it has never been feasible for the kernel to prevent
> sys_rtas()-based sequences from being disrupted because control
> returns to user space on every call. sys_rtas()-based users of these
> functions have always been, and continue to be, responsible for
> coordinating their call sequences with other users, even those which
> may invoke the RTAS functions through less direct means than
> sys_rtas(). This is an unavoidable consequence of exposing
> sequence-based RTAS functions through sys_rtas().
>
> * Add new rtas_function_lock() and rtas_function_unlock() APIs for use
>   with sequence-based RTAS functions.
>
> * Add an optional per-function mutex to struct rtas_function. When this
>   member is set, kernel-internal callers of the RTAS function are
>   required to guard their call sequences with rtas_function_lock() and
>   rtas_function_unlock(). This requirement will be enforced in a later
>   change, after all affected call sites are updated.
>
> * Populate the lock members of function table entries where
>   serialization of call sequences is known to be necessary, along with
>   justifying commentary.
>
> * In sys_rtas(), acquire the per-function mutex when it is present.
>
> There should be no perceivable change introduced here except that
> concurrent callers of the same RTAS function via sys_rtas() may block
> on a mutex instead of spinning on rtas_lock. Changes to follow will
> add rtas_function_lock()/unlock() pairs to kernel-based call
> sequences.
>

Can you add an example of the last part. I did look at to find 06 to
find the details=20

	rtas_function_lock(RTAS_FN_IBM_ACTIVATE_FIRMWARE);

	do {
		fwrc =3D rtas_call(token, 0, 1, NULL);
	} while (rtas_busy_delay(fwrc));

	rtas_function_unlock(RTAS_FN_IBM_ACTIVATE_FIRMWARE);

Reviewed-by: Aneesh Kumar K.V (IBM) <aneesh.kumar@kernel.org>

>
> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/rtas.h |   2 +
>  arch/powerpc/kernel/rtas.c      | 101 ++++++++++++++++++++++++++++++++++=
+++++-
>  2 files changed, 101 insertions(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/rtas.h b/arch/powerpc/include/asm/r=
tas.h
> index b73010583a8d..9a20caba6858 100644
> --- a/arch/powerpc/include/asm/rtas.h
> +++ b/arch/powerpc/include/asm/rtas.h
> @@ -421,6 +421,8 @@ static inline bool rtas_function_implemented(const rt=
as_fn_handle_t handle)
>  {
>  	return rtas_function_token(handle) !=3D RTAS_UNKNOWN_SERVICE;
>  }
> +void rtas_function_lock(rtas_fn_handle_t handle);
> +void rtas_function_unlock(rtas_fn_handle_t handle);
>  extern int rtas_token(const char *service);
>  extern int rtas_service_present(const char *service);
>  extern int rtas_call(int token, int, int, int *, ...);
> diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
> index 1fc0b3fffdd1..52f2242d0c28 100644
> --- a/arch/powerpc/kernel/rtas.c
> +++ b/arch/powerpc/kernel/rtas.c
> @@ -18,6 +18,7 @@
>  #include <linux/kernel.h>
>  #include <linux/lockdep.h>
>  #include <linux/memblock.h>
> +#include <linux/mutex.h>
>  #include <linux/of.h>
>  #include <linux/of_fdt.h>
>  #include <linux/reboot.h>
> @@ -70,14 +71,34 @@ struct rtas_filter {
>   *                            ppc64le, and we want to keep it that way. =
It does
>   *                            not make sense for this to be set when @fi=
lter
>   *                            is NULL.
> + * @lock: Pointer to an optional dedicated per-function mutex. This
> + *        should be set for functions that require multiple calls in
> + *        sequence to complete a single operation, and such sequences
> + *        will disrupt each other if allowed to interleave. Users of
> + *        this function are required to hold the associated lock for
> + *        the duration of the call sequence. Add an explanatory
> + *        comment to the function table entry if setting this member.
>   */
>  struct rtas_function {
>  	s32 token;
>  	const bool banned_for_syscall_on_le:1;
>  	const char * const name;
>  	const struct rtas_filter *filter;
> +	struct mutex *lock;
>  };
>=20=20
> +/*
> + * Per-function locks. Access these through the
> + * rtas_function_lock/unlock APIs, not directly.
> + */
> +static DEFINE_MUTEX(rtas_ibm_activate_firmware_lock);
> +static DEFINE_MUTEX(rtas_ibm_get_dynamic_sensor_state_lock);
> +static DEFINE_MUTEX(rtas_ibm_get_indices_lock);
> +static DEFINE_MUTEX(rtas_ibm_get_vpd_lock);
> +static DEFINE_MUTEX(rtas_ibm_lpar_perftools_lock);
> +static DEFINE_MUTEX(rtas_ibm_physical_attestation_lock);
> +static DEFINE_MUTEX(rtas_ibm_set_dynamic_indicator_lock);
> +
>  static struct rtas_function rtas_function_table[] __ro_after_init =3D {
>  	[RTAS_FNIDX__CHECK_EXCEPTION] =3D {
>  		.name =3D "check-exception",
> @@ -125,6 +146,13 @@ static struct rtas_function rtas_function_table[] __=
ro_after_init =3D {
>  			.buf_idx1 =3D -1, .size_idx1 =3D -1,
>  			.buf_idx2 =3D -1, .size_idx2 =3D -1,
>  		},
> +		/*
> +		 * PAPR doesn't explicitly impose any restriction, but
> +		 * this typically requires multiple calls before
> +		 * success, and there's no reason to allow sequences
> +		 * to interleave.
> +		 */
> +		.lock =3D &rtas_ibm_activate_firmware_lock,
>  	},
>  	[RTAS_FNIDX__IBM_CBE_START_PTCAL] =3D {
>  		.name =3D "ibm,cbe-start-ptcal",
> @@ -196,6 +224,12 @@ static struct rtas_function rtas_function_table[] __=
ro_after_init =3D {
>  			.buf_idx1 =3D 1, .size_idx1 =3D -1,
>  			.buf_idx2 =3D -1, .size_idx2 =3D -1,
>  		},
> +		/*
> +		 * PAPR+ R1=E2=80=937.3.19=E2=80=933 is explicit that the OS must not
> +		 * call ibm,get-dynamic-sensor-state with different
> +		 * inputs until a non-retry status has been returned.
> +		 */
> +		.lock =3D &rtas_ibm_get_dynamic_sensor_state_lock,
>  	},
>  	[RTAS_FNIDX__IBM_GET_INDICES] =3D {
>  		.name =3D "ibm,get-indices",
> @@ -203,6 +237,12 @@ static struct rtas_function rtas_function_table[] __=
ro_after_init =3D {
>  			.buf_idx1 =3D 2, .size_idx1 =3D 3,
>  			.buf_idx2 =3D -1, .size_idx2 =3D -1,
>  		},
> +		/*
> +		 * PAPR+ R1=E2=80=937.3.17=E2=80=932 says that the OS must not
> +		 * interleave ibm,get-indices call sequences with
> +		 * different inputs.
> +		 */
> +		.lock =3D &rtas_ibm_get_indices_lock,
>  	},
>  	[RTAS_FNIDX__IBM_GET_RIO_TOPOLOGY] =3D {
>  		.name =3D "ibm,get-rio-topology",
> @@ -220,6 +260,11 @@ static struct rtas_function rtas_function_table[] __=
ro_after_init =3D {
>  			.buf_idx1 =3D 0, .size_idx1 =3D -1,
>  			.buf_idx2 =3D 1, .size_idx2 =3D 2,
>  		},
> +		/*
> +		 * PAPR+ R1=E2=80=937.3.20=E2=80=934 indicates that sequences
> +		 * should not be allowed to interleave.
> +		 */
> +		.lock =3D &rtas_ibm_get_vpd_lock,
>  	},
>  	[RTAS_FNIDX__IBM_GET_XIVE] =3D {
>  		.name =3D "ibm,get-xive",
> @@ -239,6 +284,11 @@ static struct rtas_function rtas_function_table[] __=
ro_after_init =3D {
>  			.buf_idx1 =3D 2, .size_idx1 =3D 3,
>  			.buf_idx2 =3D -1, .size_idx2 =3D -1,
>  		},
> +		/*
> +		 * PAPR+ R1=E2=80=937.3.26=E2=80=936 says the OS should allow only one
> +		 * call sequence in progress at a time.
> +		 */
> +		.lock =3D &rtas_ibm_lpar_perftools_lock,
>  	},
>  	[RTAS_FNIDX__IBM_MANAGE_FLASH_IMAGE] =3D {
>  		.name =3D "ibm,manage-flash-image",
> @@ -277,6 +327,14 @@ static struct rtas_function rtas_function_table[] __=
ro_after_init =3D {
>  			.buf_idx1 =3D 0, .size_idx1 =3D 1,
>  			.buf_idx2 =3D -1, .size_idx2 =3D -1,
>  		},
> +		/*
> +		 * This follows a sequence-based pattern similar to
> +		 * ibm,get-vpd et al. Since PAPR+ restricts
> +		 * interleaving call sequences for other functions of
> +		 * this style, assume the restriction applies here,
> +		 * even though it's not explicit in the spec.
> +		 */
> +		.lock =3D &rtas_ibm_physical_attestation_lock,
>  	},
>  	[RTAS_FNIDX__IBM_PLATFORM_DUMP] =3D {
>  		.name =3D "ibm,platform-dump",
> @@ -284,6 +342,13 @@ static struct rtas_function rtas_function_table[] __=
ro_after_init =3D {
>  			.buf_idx1 =3D 4, .size_idx1 =3D 5,
>  			.buf_idx2 =3D -1, .size_idx2 =3D -1,
>  		},
> +		/*
> +		 * PAPR+ 7.3.3.4.1 indicates that concurrent sequences
> +		 * of ibm,platform-dump are allowed if they are
> +		 * operating on different dump tags. So leave
> +		 * the lock pointer unset for now. This may need
> +		 * reconsideration if kernel-internal users appear.
> +		 */
>  	},
>  	[RTAS_FNIDX__IBM_POWER_OFF_UPS] =3D {
>  		.name =3D "ibm,power-off-ups",
> @@ -326,6 +391,12 @@ static struct rtas_function rtas_function_table[] __=
ro_after_init =3D {
>  			.buf_idx1 =3D 2, .size_idx1 =3D -1,
>  			.buf_idx2 =3D -1, .size_idx2 =3D -1,
>  		},
> +		/*
> +		 * PAPR+ R1=E2=80=937.3.18=E2=80=933 says the OS must not call this
> +		 * function with different inputs until a non-retry
> +		 * status has been returned.
> +		 */
> +		.lock =3D &rtas_ibm_set_dynamic_indicator_lock,
>  	},
>  	[RTAS_FNIDX__IBM_SET_EEH_OPTION] =3D {
>  		.name =3D "ibm,set-eeh-option",
> @@ -556,9 +627,9 @@ static int __init rtas_token_to_function_xarray_init(=
void)
>  }
>  arch_initcall(rtas_token_to_function_xarray_init);
>=20=20
> -static const struct rtas_function *rtas_token_to_function(s32 token)
> +static struct rtas_function *rtas_token_to_function(s32 token)
>  {
> -	const struct rtas_function *func;
> +	struct rtas_function *func;
>=20=20
>  	if (WARN_ONCE(token < 0, "invalid token %d", token))
>  		return NULL;
> @@ -581,6 +652,28 @@ static const struct rtas_function *rtas_token_to_fun=
ction(s32 token)
>  	return NULL;
>  }
>=20=20
> +static void __rtas_function_lock(struct rtas_function *func)
> +{
> +	if (func && func->lock)
> +		mutex_lock(func->lock);
> +}
> +
> +static void __rtas_function_unlock(struct rtas_function *func)
> +{
> +	if (func && func->lock)
> +		mutex_unlock(func->lock);
> +}
> +
> +void rtas_function_lock(const rtas_fn_handle_t handle)
> +{
> +	__rtas_function_lock(rtas_function_lookup(handle));
> +}
> +
> +void rtas_function_unlock(const rtas_fn_handle_t handle)
> +{
> +	__rtas_function_unlock(rtas_function_lookup(handle));
> +}
> +
>  /* This is here deliberately so it's only used in this file */
>  void enter_rtas(unsigned long);
>=20=20
> @@ -1885,6 +1978,8 @@ SYSCALL_DEFINE1(rtas, struct rtas_args __user *, ua=
rgs)
>=20=20
>  	buff_copy =3D get_errorlog_buffer();
>=20=20
> +	__rtas_function_lock(rtas_token_to_function(token));
> +
>  	raw_spin_lock_irqsave(&rtas_lock, flags);
>  	cookie =3D lockdep_pin_lock(&rtas_lock);
>=20=20
> @@ -1900,6 +1995,8 @@ SYSCALL_DEFINE1(rtas, struct rtas_args __user *, ua=
rgs)
>  	lockdep_unpin_lock(&rtas_lock, cookie);
>  	raw_spin_unlock_irqrestore(&rtas_lock, flags);
>=20=20
> +	__rtas_function_unlock(rtas_token_to_function(token));
> +
>  	if (buff_copy) {
>  		if (errbuf)
>  			log_error(errbuf, ERR_TYPE_RTAS_LOG, 0);
>
> --=20
> 2.41.0

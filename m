Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 202F87661B1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jul 2023 04:12:03 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=o22dWJ2D;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RBrjs0M2yz3cRg
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jul 2023 12:12:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=o22dWJ2D;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RBrhy091lz2yW5
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jul 2023 12:11:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1690510268;
	bh=9p0179wlkzJ3Z8MDRAzQjbNImoc/8M+M08HWVsiX+dI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=o22dWJ2D+dUGOeZbvuYtw0blCLH3FsUgRK7V+7RsxS34b3h/MMUH7n6KolqSFlwDW
	 AzJMg1LeppmkhzqiNBGoiA+YuSmraAbB/X2Xnsb8Auliw3fZA+4HI9uNYaFSwqwHV0
	 J8haxmDaGSDKu4YruSoWdkjBNoDo89H8ON7tE6mfE0qbVvlLiLFG7OosFfMvu/RB5H
	 CGueWFMB4UJdKx09+Tdk6TIWCwO83yXLVnEPERoV3yFADFW+e0Fj0TcGOQBB6mAsQg
	 nYptlPX3uA38dfC22sPot0NSKGE6kUkVbCsK0rO+r8RCM4IPLY87zBA12UDBQx2Uy0
	 1bp4ksVg31DrQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RBrhr3RqMz4wqW;
	Fri, 28 Jul 2023 12:11:08 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Ondrej Mosnacek <omosnace@redhat.com>, Paul Moore <paul@paul-moore.com>
Subject: Login broken with old userspace (was Re: [PATCH v2] selinux:
 introduce an initial SID for early boot processes)
In-Reply-To: <20230620131223.431281-1-omosnace@redhat.com>
References: <20230620131223.431281-1-omosnace@redhat.com>
Date: Fri, 28 Jul 2023 12:11:07 +1000
Message-ID: <87edkseqf8.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: selinux@vger.kernel.org, linux-next@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, LKML <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Ondrej Mosnacek <omosnace@redhat.com> writes:
> Currently, SELinux doesn't allow distinguishing between kernel threads
> and userspace processes that are started before the policy is first
> loaded - both get the label corresponding to the kernel SID. The only
> way a process that persists from early boot can get a meaningful label
> is by doing a voluntary dyntransition or re-executing itself.

Hi,

This commit breaks login for me when booting linux-next kernels with old
userspace, specifically Ubuntu 16.04 on ppc64le. 18.04 is OK.

The symptom is that login never accepts the root password, it just
always says "Login incorrect".

Bisect points to this commit.

Reverting this commit on top of next-20230726, fixes the problem
(ie. login works again).

Booting with selinux=0 also fixes the problem.

Is this expected? The change log below suggests backward compatibility
was considered, is 16.04 just too old?

cheers


> Reusing the kernel label for userspace processes is problematic for
> several reasons:
> 1. The kernel is considered to be a privileged domain and generally
>    needs to have a wide range of permissions allowed to work correctly,
>    which prevents the policy writer from effectively hardening against
>    early boot processes that might remain running unintentionally after
>    the policy is loaded (they represent a potential extra attack surface
>    that should be mitigated).
> 2. Despite the kernel being treated as a privileged domain, the policy
>    writer may want to impose certain special limitations on kernel
>    threads that may conflict with the requirements of intentional early
>    boot processes. For example, it is a good hardening practice to limit
>    what executables the kernel can execute as usermode helpers and to
>    confine the resulting usermode helper processes. However, a
>    (legitimate) process surviving from early boot may need to execute a
>    different set of executables.
> 3. As currently implemented, overlayfs remembers the security context of
>    the process that created an overlayfs mount and uses it to bound
>    subsequent operations on files using this context. If an overlayfs
>    mount is created before the SELinux policy is loaded, these "mounter"
>    checks are made against the kernel context, which may clash with
>    restrictions on the kernel domain (see 2.).
>
> To resolve this, introduce a new initial SID (reusing the slot of the
> former "init" initial SID) that will be assigned to any userspace
> process started before the policy is first loaded. This is easy to do,
> as we can simply label any process that goes through the
> bprm_creds_for_exec LSM hook with the new init-SID instead of
> propagating the kernel SID from the parent.
>
> To provide backwards compatibility for existing policies that are
> unaware of this new semantic of the "init" initial SID, introduce a new
> policy capability "userspace_initial_context" and set the "init" SID to
> the same context as the "kernel" SID unless this capability is set by
> the policy.
>
> Signed-off-by: Ondrej Mosnacek <omosnace@redhat.com>
> ---
>
> v2: apply Paul's style suggestions
>
>  security/selinux/hooks.c                      | 28 +++++++++++++++++++
>  .../selinux/include/initial_sid_to_string.h   |  2 +-
>  security/selinux/include/policycap.h          |  1 +
>  security/selinux/include/policycap_names.h    |  3 +-
>  security/selinux/include/security.h           |  6 ++++
>  security/selinux/ss/policydb.c                | 27 ++++++++++++++++++
>  6 files changed, 65 insertions(+), 2 deletions(-)
>
> diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
> index 99ded60a6b911..83d71433e23e9 100644
> --- a/security/selinux/hooks.c
> +++ b/security/selinux/hooks.c
> @@ -2264,6 +2264,19 @@ static int selinux_bprm_creds_for_exec(struct linux_binprm *bprm)
>  	new_tsec->keycreate_sid = 0;
>  	new_tsec->sockcreate_sid = 0;
>
> +	/*
> +	 * Before policy is loaded, label any task outside kernel space
> +	 * as SECINITSID_INIT, so that any userspace tasks surviving from
> +	 * early boot end up with a label different from SECINITSID_KERNEL
> +	 * (if the policy chooses to set SECINITSID_INIT != SECINITSID_KERNEL).
> +	 */
> +	if (!selinux_initialized()) {
> +		new_tsec->sid = SECINITSID_INIT;
> +		/* also clear the exec_sid just in case */
> +		new_tsec->exec_sid = 0;
> +		return 0;
> +	}
> +
>  	if (old_tsec->exec_sid) {
>  		new_tsec->sid = old_tsec->exec_sid;
>  		/* Reset exec SID on execve. */
> @@ -4480,6 +4493,21 @@ static int sock_has_perm(struct sock *sk, u32 perms)
>  	if (sksec->sid == SECINITSID_KERNEL)
>  		return 0;
>
> +	/*
> +	 * Before POLICYDB_CAP_USERSPACE_INITIAL_CONTEXT, sockets that
> +	 * inherited the kernel context from early boot used to be skipped
> +	 * here, so preserve that behavior unless the capability is set.
> +	 *
> +	 * By setting the capability the policy signals that it is ready
> +	 * for this quirk to be fixed. Note that sockets created by a kernel
> +	 * thread or a usermode helper executed without a transition will
> +	 * still be skipped in this check regardless of the policycap
> +	 * setting.
> +	 */
> +	if (!selinux_policycap_userspace_initial_context() &&
> +	    sksec->sid == SECINITSID_INIT)
> +		return 0;
> +
>  	ad.type = LSM_AUDIT_DATA_NET;
>  	ad.u.net = &net;
>  	ad.u.net->sk = sk;
> diff --git a/security/selinux/include/initial_sid_to_string.h b/security/selinux/include/initial_sid_to_string.h
> index 60820517aa438..6d450669e9c68 100644
> --- a/security/selinux/include/initial_sid_to_string.h
> +++ b/security/selinux/include/initial_sid_to_string.h
> @@ -7,7 +7,7 @@ static const char *const initial_sid_to_string[] = {
>  	NULL,
>  	"file",
>  	NULL,
> -	NULL,
> +	"init",
>  	"any_socket",
>  	"port",
>  	"netif",
> diff --git a/security/selinux/include/policycap.h b/security/selinux/include/policycap.h
> index f35d3458e71de..c7373e6effe5d 100644
> --- a/security/selinux/include/policycap.h
> +++ b/security/selinux/include/policycap.h
> @@ -12,6 +12,7 @@ enum {
>  	POLICYDB_CAP_NNP_NOSUID_TRANSITION,
>  	POLICYDB_CAP_GENFS_SECLABEL_SYMLINKS,
>  	POLICYDB_CAP_IOCTL_SKIP_CLOEXEC,
> +	POLICYDB_CAP_USERSPACE_INITIAL_CONTEXT,
>  	__POLICYDB_CAP_MAX
>  };
>  #define POLICYDB_CAP_MAX (__POLICYDB_CAP_MAX - 1)
> diff --git a/security/selinux/include/policycap_names.h b/security/selinux/include/policycap_names.h
> index 2a87fc3702b81..28e4c9ee23997 100644
> --- a/security/selinux/include/policycap_names.h
> +++ b/security/selinux/include/policycap_names.h
> @@ -13,7 +13,8 @@ const char *const selinux_policycap_names[__POLICYDB_CAP_MAX] = {
>  	"cgroup_seclabel",
>  	"nnp_nosuid_transition",
>  	"genfs_seclabel_symlinks",
> -	"ioctl_skip_cloexec"
> +	"ioctl_skip_cloexec",
> +	"userspace_initial_context",
>  };
>
>  #endif /* _SELINUX_POLICYCAP_NAMES_H_ */
> diff --git a/security/selinux/include/security.h b/security/selinux/include/security.h
> index 8746fafeb7789..c08b8b58439c9 100644
> --- a/security/selinux/include/security.h
> +++ b/security/selinux/include/security.h
> @@ -201,6 +201,12 @@ static inline bool selinux_policycap_ioctl_skip_cloexec(void)
>  	return READ_ONCE(state->policycap[POLICYDB_CAP_IOCTL_SKIP_CLOEXEC]);
>  }
>
> +static inline bool selinux_policycap_userspace_initial_context(void)
> +{
> +	return READ_ONCE(
> +		selinux_state.policycap[POLICYDB_CAP_USERSPACE_INITIAL_CONTEXT]);
> +}
> +
>  struct selinux_policy_convert_data;
>
>  struct selinux_load_state {
> diff --git a/security/selinux/ss/policydb.c b/security/selinux/ss/policydb.c
> index 97c0074f9312a..c5465a0b8055a 100644
> --- a/security/selinux/ss/policydb.c
> +++ b/security/selinux/ss/policydb.c
> @@ -863,6 +863,8 @@ void policydb_destroy(struct policydb *p)
>  int policydb_load_isids(struct policydb *p, struct sidtab *s)
>  {
>  	struct ocontext *head, *c;
> +	bool isid_init_supported = ebitmap_get_bit(&p->policycaps,
> +						   POLICYDB_CAP_USERSPACE_INITIAL_CONTEXT);
>  	int rc;
>
>  	rc = sidtab_init(s);
> @@ -886,6 +888,13 @@ int policydb_load_isids(struct policydb *p, struct sidtab *s)
>  		if (!name)
>  			continue;
>
> +		/*
> +		 * Also ignore SECINITSID_INIT if the policy doesn't declare
> +		 * support for it
> +		 */
> +		if (sid == SECINITSID_INIT && !isid_init_supported)
> +			continue;
> +
>  		rc = sidtab_set_initial(s, sid, &c->context[0]);
>  		if (rc) {
>  			pr_err("SELinux:  unable to load initial SID %s.\n",
> @@ -893,6 +902,24 @@ int policydb_load_isids(struct policydb *p, struct sidtab *s)
>  			sidtab_destroy(s);
>  			return rc;
>  		}
> +
> +		/*
> +		 * If the policy doesn't support the "userspace_initial_context"
> +		 * capability, set SECINITSID_INIT to the same context as
> +		 * SECINITSID_KERNEL. This ensures the same behavior as before
> +		 * the reintroduction of SECINITSID_INIT, where all tasks
> +		 * started before policy load would initially get the context
> +		 * corresponding to SECINITSID_KERNEL.
> +		 */
> +		if (sid == SECINITSID_KERNEL && !isid_init_supported) {
> +			rc = sidtab_set_initial(s, SECINITSID_INIT, &c->context[0]);
> +			if (rc) {
> +				pr_err("SELinux:  unable to load initial SID %s.\n",
> +				       name);
> +				sidtab_destroy(s);
> +				return rc;
> +			}
> +		}
>  	}
>  	return 0;
>  }
> --
> 2.41.0

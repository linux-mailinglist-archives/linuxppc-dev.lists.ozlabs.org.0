Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB501097D2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Nov 2019 03:29:58 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47MSXz5PzHzDqgH
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Nov 2019 13:29:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47MSW44gKpzDqfr
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Nov 2019 13:28:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="FgztwZwN"; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 47MSW10MKdz9sPT;
 Tue, 26 Nov 2019 13:28:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1574735296;
 bh=bDpBpExv22RYZg9+7U2ew6DFKYXTfeM4Kl6AcYjAgzY=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=FgztwZwNJDiZ7EM+Yr9+ALlLY8vEMT2mnd8WXWdEpCdnNkQw4xADD7XKzgrAvyTT6
 Cv8gvnycwfKKIrTHQap0Kk81nvKOZy4ya9O9B5p54sNMtFw6gB+KXD740JrhoRBVBb
 6596F6YHpp7MSRpyBiawhr2fkyofqG43h728IvxqU1zbTSj1FMKsCNqxnKsOUNtlmQ
 SnW8YYx/zorrarGVZl5iN4E3DNR8RtnqVkgL+HMW28EN0QoLZqjzZNbtfHCdxoh2d2
 emHH3FOjfo12nuIt9IUJuHvMDOUxHV3MfmfnjhuDRR71JXglFzeMO+YefJWdIkS+rF
 sfXYWJPnubq8Q==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Gustavo Walbon <gwalbon@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH][v2] powerpc: Set right value of Speculation_Store_Bypass
 in /proc/<pid>/status
In-Reply-To: <20191123230235.11888-1-gwalbon@linux.ibm.com>
References: <20191123230235.11888-1-gwalbon@linux.ibm.com>
Date: Tue, 26 Nov 2019 13:28:10 +1100
Message-ID: <87v9r79xs5.fsf@mpe.ellerman.id.au>
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
Cc: geert+renesas@glider.be, jkosina@suse.cz, gwalbon@linux.ibm.com,
 cmr@informatik.wtf, yuehaibing@huawei.com, linux-kernel@vger.kernel.org,
 diana.craciun@nxp.com, paulus@samba.org, jpoimboe@redhat.com,
 maurosr@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Gustavo Walbon <gwalbon@linux.ibm.com> writes:
> The issue has showed the value of status of Speculation_Store_Bypass in the
> /proc/<pid>/status as `unknown` for PowerPC systems.
>
> The patch fix the checking of the mitigation status of Speculation, and
> can be reported as "not vulnerable", "globally mitigated" or "vulnerable".
>
> Link: https://github.com/linuxppc/issues/issues/255
>
> Changelog:
> Rebase on v5.4-rc8
>
> Signed-off-by: Gustavo Walbon <gwalbon@linux.ibm.com>
> ---
>  arch/powerpc/kernel/security.c | 25 ++++++++++++++++++++++++-
>  1 file changed, 24 insertions(+), 1 deletion(-)

On further thoughts I don't think this logic (which I suggested) is
right >:(

I commented on the issue:

  I think my original suggestion on this was wrong.
  
  Our mitigation is not global, ie. it's a barrier that must be used in
  the right location. We have kernel code to insert the barrier on
  kernel entry/exit, but that doesn't protect userspace against itself
  (ie. sandboxes).
  
  There's no way to express that with the current values as far as I can
  see.
  
  I think all we can do for now is:
  
  if stf_enabled_flush_types == STF_BARRIER_NONE:
    return PR_SPEC_NOT_AFFECTED // "not vulnerable"
  else
    return PR_SPEC_ENABLE // "vulnerable"
  
  To express the situation properly we'd need another value, something
  like PR_SPEC_MITIGATION_AVAILABLE (??) which says that there is a
  mitigation available but it must be used. That still has the problem
  that it doesn't tell userspace what the mitigation is, userspace would
  have to know.

cheers

> diff --git a/arch/powerpc/kernel/security.c b/arch/powerpc/kernel/security.c
> index 7d4b2080a658..04e566026bbc 100644
> --- a/arch/powerpc/kernel/security.c
> +++ b/arch/powerpc/kernel/security.c
> @@ -14,7 +14,7 @@
>  #include <asm/debugfs.h>
>  #include <asm/security_features.h>
>  #include <asm/setup.h>
> -
> +#include <linux/prctl.h>
>  
>  u64 powerpc_security_features __read_mostly = SEC_FTR_DEFAULT;
>  
> @@ -344,6 +344,29 @@ ssize_t cpu_show_spec_store_bypass(struct device *dev, struct device_attribute *
>  	return sprintf(buf, "Vulnerable\n");
>  }
>  
> +static int ssb_prctl_get(struct task_struct *task)
> +{
> +	if (stf_barrier) {
> +		if (stf_enabled_flush_types == STF_BARRIER_NONE)
> +			return PR_SPEC_NOT_AFFECTED;
> +		else
> +			return PR_SPEC_DISABLE;
> +	} else
> +		return PR_SPEC_DISABLE_NOEXEC;
> +
> +	return -EINVAL;
> +}
> +
> +int arch_prctl_spec_ctrl_get(struct task_struct *task, unsigned long which)
> +{
> +	switch (which) {
> +	case PR_SPEC_STORE_BYPASS:
> +		return ssb_prctl_get(task);
> +	default:
> +		return -ENODEV;
> +	}
> +}
> +
>  #ifdef CONFIG_DEBUG_FS
>  static int stf_barrier_set(void *data, u64 val)
>  {
> -- 
> 2.19.1

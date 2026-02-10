Return-Path: <linuxppc-dev+bounces-16789-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2PUOIxehi2l1XQAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16789-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Feb 2026 22:20:23 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C93D211F5E9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Feb 2026 22:20:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f9ZGX4f97z2xJF;
	Wed, 11 Feb 2026 08:20:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770758420;
	cv=none; b=a42loS+M0mimMdyroLtLnfvOoqA99u6Pf88eZt5+Q7M04JHmMv+GS28Y95cjXV0Dqqh5vCqD79aSfJ2Ool+i/Dex9OgoZRXYqFPzd7e9QWupSQKG4oVRxrcZPsDQWLJP2sdNZqbVUqFfiZ4DYFUoOfbbFgNU2x8FKdwEQdUjXYTvUH2y14mwAwB5dTs3ickgELpPK3KpuJwJYB3D+mf7aqPaua+1/wqSxKumy8CdC31LU1M1AZJGPly13o4PO5IXlaf+1MqJnsO89kB3MAB/7fRRH6tRVTmQXnUeYBqKrCHiU0IlG5jGRjeDgPwySHyLFe0kg6uWDuopicRsinU2JA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770758420; c=relaxed/relaxed;
	bh=s5E5iGHrWPwlv1TaHmRYDt3L56YpfhHi32qzo5ZNZx8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BmmB+F/JuKMMa0DSATR/v0TqwbUjOy9PznXRP4mYaU2JlK2MCi19neZBB2WEx6DHXNRNMlANXtMhrJTI5MUZxp0vTzsDiYbYvjhI7W5dm/mCpXAk9MfGm205XxFi9xbkTV5LsP8+fnSiUw44jSX+Bn0SY5A8Bc2ps6fsEHi887pJKi7pC5zPQn65HtTQIjz1BkeOJdzLOwRypwFAv3Y5UvVKXvOUYknehlddGvgZ3D9tCfoiEX49fHSIOd9+reCVw9Leuq1zzQLU3GkwFipJ7SZK9HMyYmoiw2eL3PV5RaiCCCUlwZ2xgDyRNN9hTcQkQWlQmAjkq4oS8/tsklEDzg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jBuuKgGy; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jBuuKgGy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f9ZGR70qZz2xC3
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Feb 2026 08:20:15 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3CD8B44022;
	Tue, 10 Feb 2026 21:20:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EAE8C116C6;
	Tue, 10 Feb 2026 21:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770758413;
	bh=0bpA5wvvJckbZhDqQnp7IZzgogiw3mVzH8eI7Up3uuI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jBuuKgGySempnJ7d5N/SbfM1cX3JZ5cQPXT3/T9MvLDMRq6+ZBqPfpyKCHut3usbO
	 ziYE/CIT/mG39+RVOUlNBOPiXqrPtfy3ZGEa9RZE40lsxsfaub8jQKp/5aML6Ou/+a
	 QckbFDJxMY3G9BW5Y9d0OMPjou8SC0MvF1SPLTE58G9ht3WpRs2O5glbFqs9T9f2ql
	 TdIdouM/m5MW4Uou5JDcZgu2L0nPRy4nmDDoZXH1lAAs/wp7LObWZyQcFQSG0PSufd
	 ulXFuFboSEjIGD2qrSRHDd1Js2XEHY6Xjlc1kFPYh4pyd/1DNqXhG3f+qHGpr9qE1U
	 uZqeU7ZEUC+WQ==
Date: Tue, 10 Feb 2026 14:20:07 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Sathvika Vasireddy <sv@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, masahiroy@kernel.org,
	kees@kernel.org, naveen@kernel.org, jpoimboe@kernel.org,
	peterz@infradead.org, npiggin@gmail.com, maddy@linux.ibm.com,
	segher@kernel.crashing.org, christophe.leroy@csgroup.eu,
	mingo@kernel.org, mpe@ellerman.id.au, nsc@kernel.org
Subject: Re: [RFC PATCH v3 6/6] powerpc: Enable build-time feature fixup
 processing by default
Message-ID: <20260210212007.GA1148627@ax162>
References: <20260209084820.57298-1-sv@linux.ibm.com>
 <20260209084820.57298-7-sv@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260209084820.57298-7-sv@linux.ibm.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.71 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[nathan@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:sv@linux.ibm.com,m:linux-kernel@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:masahiroy@kernel.org,m:kees@kernel.org,m:naveen@kernel.org,m:jpoimboe@kernel.org,m:peterz@infradead.org,m:npiggin@gmail.com,m:maddy@linux.ibm.com,m:segher@kernel.crashing.org,m:christophe.leroy@csgroup.eu,m:mingo@kernel.org,m:mpe@ellerman.id.au,m:nsc@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-16789-lists,linuxppc-dev=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.ozlabs.org,kernel.org,infradead.org,gmail.com,linux.ibm.com,kernel.crashing.org,csgroup.eu,ellerman.id.au];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,sourceware.org:url]
X-Rspamd-Queue-Id: C93D211F5E9
X-Rspamd-Action: no action

On Mon, Feb 09, 2026 at 02:18:20PM +0530, Sathvika Vasireddy wrote:
> diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
> index e3dd7fc62f20..3d2a203b8908 100644
> --- a/scripts/Makefile.vmlinux
> +++ b/scripts/Makefile.vmlinux
> @@ -88,6 +88,11 @@ remove-section-$(CONFIG_ARCH_VMLINUX_NEEDS_RELOCS) += '.rel*' '!.rel*.dyn'
>  # https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=c12d9fa2afe7abcbe407a00e15719e1a1350c2a7
>  remove-section-$(CONFIG_ARCH_VMLINUX_NEEDS_RELOCS) += '.rel.*'
>  
> +# --emit-relocs produces .rela.* sections needed by objtool --ftr-fixup;
> +# strip them from vmlinux after fixup processing is complete.
> +remove-section-$(CONFIG_HAVE_OBJTOOL_FTR_FIXUP)    += '.rel*' '!.rel*.dyn'
> +remove-section-$(CONFIG_HAVE_OBJTOOL_FTR_FIXUP)    += '.rel.*'

Rather than duplicating the remove-section values from
CONFIG_ARCH_VMLINUX_NEEDS_RELOCS, I would like to see them combined with
something like:

diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
index fcae1e432d9a..f70c3a36aee2 100644
--- a/scripts/Makefile.vmlinux
+++ b/scripts/Makefile.vmlinux
@@ -81,11 +81,15 @@ endif
 # vmlinux
 # ---------------------------------------------------------------------------
 
+# These configurations require vmlinux.unstripped to be linked with
+# '--emit-relocs', which need to be stripped from the final vmlinux.
+uses-emit-relocs := $(or $(CONFIG_ARCH_VMLINUX_NEEDS_RELOCS),$(CONFIG_HAVE_OBJTOOL_FTR_FIXUP))
+
 remove-section-y                                   := .modinfo
-remove-section-$(CONFIG_ARCH_VMLINUX_NEEDS_RELOCS) += '.rel*' '!.rel*.dyn'
+remove-section-$(uses-emit-relocs)                 += '.rel*' '!.rel*.dyn'
 # for compatibility with binutils < 2.32
 # https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=c12d9fa2afe7abcbe407a00e15719e1a1350c2a7
-remove-section-$(CONFIG_ARCH_VMLINUX_NEEDS_RELOCS) += '.rel.*'
+remove-section-$(uses-emit-relocs)                 += '.rel.*'
 
 remove-symbols := -w --strip-unneeded-symbol='__mod_device_table__*'
 


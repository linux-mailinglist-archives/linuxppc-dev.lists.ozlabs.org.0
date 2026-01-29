Return-Path: <linuxppc-dev+bounces-16387-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yBjeNiL5emkwAQIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16387-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jan 2026 07:07:30 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A6BAC231
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jan 2026 07:07:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f1pZk3nY4z2yFl;
	Thu, 29 Jan 2026 17:07:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769666846;
	cv=none; b=YoMmlKsvgUVU1iNauXWg3+Pgdk+iOF2pYUZegwuEWKHckwHP0JbVEMvI4al8yaUW4lCFOn2Ee5sfU68Zfvh+Yh4XUEN8jyu0ENiszsye6pmTfZyyutDJII8DTNDQPYSU3o7EqUg9V+WqywWknMs9Vi3TD74q1X/xsT3dOPy04CpxUljPqhumB3ObJ4UDzIKDbsf3xs44t4rakqALBp6CVmg77W0uBo/wEz0TBwEOfgN1yJC+JKKs0jflOjEguCzZDVL8JMIu/0PXJlLMF4yNfjt3iuk6P2uPW0ky1ewg/16qDzyZHYjYsDdQyNeQme7UGTpioaZZrC8B6/2LXK2GdA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769666846; c=relaxed/relaxed;
	bh=Lg49K29/VWpKKc+B1tFDetd1naud4FeHGtMiyaIlmgI=;
	h=Content-Type:MIME-Version:Message-Id:In-Reply-To:References:
	 Subject:From:To:Cc:Date; b=ku9HncwZaI/cn02B7Mcnkt1fR4wT+mVpuiG51BfxWhsrqeSvnSOeNUhev7Usp8ty11GhCYpRauBlU1ghuKWVL88MXjGA0IBe70i8+n6IuFgDMa1HMsSNoeKSjjyS62G8TwDpFzTlGAAGwOTpC4Yc6WNDRoG15DqXJd8Oo+BaB5Jcr563DOGFMFL1wLIw8FHjq0wMKGLFhEqC+l6Pyku1jcXcOPKqFMZcFSDWQjqzSmrbSHZuvFxNtN1hCfZc5EqD+4bGy7tH52wrLkjpAWBkkcHyXFaNXZS8//A/A7ZfG0xGPdjtKgCI4yygteBO9Q1IHVE2cxn54xc2duFFSJEhlQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iUaiYGpX; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=bot+bpf-ci@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iUaiYGpX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=bot+bpf-ci@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f1pZj2Njtz2xKh
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Jan 2026 17:07:25 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AD66540AD4;
	Thu, 29 Jan 2026 06:07:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D916C116D0;
	Thu, 29 Jan 2026 06:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769666842;
	bh=o1kr4MDge4qRt1w2EPnVZQ24pNn5eXA9+YNtbyjpTI0=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date:From;
	b=iUaiYGpXxfcCx1eEb8ug76lUmIHTmS6TjnjJD/VDm6kzPipx7oKSGZatc5qq1GrXF
	 ZINNbS6YtSUguHnnXpF/hLMQLluf4QahDr1FNZGM6cwGb6GRDPkSpMUH6yj4KHSL69
	 87HuorROAHT20QZIdbt0UJzH0zpCc2nnI0iJX0OEOwsdcxQJ5+2/xo1I5IU+Pt5Ina
	 Ka+nBpZjdsxY5aKFkp4H4nOroEXKCRLrnH/bCofUzzLLVk11qNZR6WX3udAO9pWybc
	 Ec0E2fs60VqtwbggnE97NcMTWKMENYyWv3bD0e6I4t12MrK2b9OieJ9GHiwAnIjq+q
	 38QV7n7i2Ev6Q==
Content-Type: multipart/mixed; boundary="===============2621773127213540498=="
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
Message-Id: <ec269f64770e0c87c198d34bef01d818108015e8952d441d8708e5cf0e9c70b9@mail.kernel.org>
In-Reply-To: <20260129054035.168078-1-skb99@linux.ibm.com>
References: <20260129054035.168078-1-skb99@linux.ibm.com>
Subject: Re: [PATCH] selftests/bpf: Add powerpc support for get_preempt_count() in selftest
From: bot+bpf-ci@kernel.org
To: skb99@linux.ibm.com,linux-kernel@vger.kernel.org,linux-kselftest@vger.kernel.org,bpf@vger.kernel.org,linuxppc-dev@lists.ozlabs.org
Cc: hbathini@linux.ibm.com,sachinpb@linux.ibm.com,venkat88@linux.ibm.com,andrii@kernel.org,eddyz87@gmail.com,ast@kernel.org,daniel@iogearbox.net,martin.lau@linux.dev,song@kernel.org,yonghong.song@linux.dev,john.fastabend@gmail.com,kpsingh@kernel.org,sdf@fomichev.me,haoluo@google.com,jolsa@kernel.org,christophe.leroy@csgroup.eu,maddy@linux.ibm.com,mpe@ellerman.id.au,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,clm@meta.com,ihor.solodrai@linux.dev
Date: Thu, 29 Jan 2026 06:07:22 +0000 (UTC)
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	CTYPE_MIXED_BOGUS(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[bot@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[linux.ibm.com,kernel.org,gmail.com,iogearbox.net,linux.dev,fomichev.me,google.com,csgroup.eu,ellerman.id.au,meta.com];
	TAGGED_FROM(0.00)[bounces-16387-lists,linuxppc-dev=lfdr.de,bpf-ci];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[bot@kernel.org,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+,1:+];
	FORGED_RECIPIENTS(0.00)[m:skb99@linux.ibm.com,m:linux-kernel@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:bpf@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:hbathini@linux.ibm.com,m:sachinpb@linux.ibm.com,m:venkat88@linux.ibm.com,m:andrii@kernel.org,m:eddyz87@gmail.com,m:ast@kernel.org,m:daniel@iogearbox.net,m:martin.lau@linux.dev,m:song@kernel.org,m:yonghong.song@linux.dev,m:john.fastabend@gmail.com,m:kpsingh@kernel.org,m:sdf@fomichev.me,m:haoluo@google.com,m:jolsa@kernel.org,m:christophe.leroy@csgroup.eu,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:martin.lau@kernel.org,m:clm@meta.com,m:ihor.solodrai@linux.dev,m:johnfastabend@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 36A6BAC231
X-Rspamd-Action: no action

--===============2621773127213540498==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> diff --git a/tools/testing/selftests/bpf/bpf_experimental.h b/tools/testing/selftests/bpf/bpf_experimental.h
> index a39576c8ba..147bbf6cd3 100644
> --- a/tools/testing/selftests/bpf/bpf_experimental.h
> +++ b/tools/testing/selftests/bpf/bpf_experimental.h
> @@ -627,6 +627,8 @@ static inline int get_preempt_count(void)
>  	return *(int *) bpf_this_cpu_ptr(&__preempt_count);
>  #elif defined(bpf_target_arm64)
>  	return bpf_get_current_task_btf()->thread_info.preempt.count;
> +#elif defined(bpf_target_powerpc)
> +	return bpf_get_current_task_btf()->thread_info.preempt_count;
>  #endif
>  	return 0;
>  }

Now that get_preempt_count() supports PowerPC, should the documentation
comments for bpf_in_interrupt(), bpf_in_nmi(), bpf_in_hardirq(),
bpf_in_serving_softirq(), and bpf_in_task() be updated to include
PowerPC in their supported architecture lists? Currently these comments
still say "Only works on the following archs: x86, arm64" but they now
also work on PowerPC via this change to get_preempt_count().


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/21467281843

AI-authorship-score: low
AI-authorship-explanation: Straightforward kernel patch with natural technical writing style and minimal code changes consistent with human-authored commits.
issues-found: 1
issue-severity-score: low
issue-severity-explanation: Documentation comments not updated to reflect PowerPC support in helper functions; minor documentation mismatch in test code.

--===============2621773127213540498==--


Return-Path: <linuxppc-dev+bounces-17570-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oCoIMojlpmnjZAAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17570-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Mar 2026 14:43:36 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 123601F08B6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Mar 2026 14:43:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fQH7g3VQWz3bnr;
	Wed, 04 Mar 2026 00:43:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772545407;
	cv=none; b=DSMd7EaCwsgp3YXm9J2p7ClETOC0KR5D5dIsLeeMcVAKLpsrvnIP1ZZniITcYPVLhW+vbVioLC58uC1fIli4uL0aKjTTpsGmrlOJVwoTqZLMMJ1mUYtX/8kcJDfU6tzlFftD+PlD5gne3WI00kt7oY0lKv3+sVSKiO0gRG8UHcqSQR34Q4ZGK/QK5dOd/uGSmFkNKlNtwn6IS+5V05S9WyKTXxgomtxeg/MrDQFjzwCD4VVTjDooEmIFKBdmsvEhmPHXmMVZLJgnRsyYWXzVttUlittLE+xcjpNN34xiw9CMCNLZllVHfG1Z6rDDYNKxZMDnNZV4dx/w71BQ+ClB4w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772545407; c=relaxed/relaxed;
	bh=V7rQY665zML/y++M7q7EL3LCxl0NCEXgWeAzunOOtjE=;
	h=Content-Type:MIME-Version:Message-Id:In-Reply-To:References:
	 Subject:From:To:Cc:Date; b=SIJW6MJGrhb3vuSSH0GFhg1MxK3OHl55XtzsnRYO3L6mJQRSUiNmXteYgE6UUrhHSWRDZzUyIuWQJoWv9LSYbnATgGwSwQlrB+lFvVa/yuE98jIMpUhXfXLr1Hx7Ku8AScZSo+Z9Ud8zCJDePZPJjRhR1RWPWfFSxz4OGntYlGc7fIZ5phJzbnVq3McPbDvW55sIlHtXNQ/Nsw0GRIa43NQJENEgi5xfWdGKztWy1ABbPUbobP7rfrRrr0NPCZfoih8riOntyBCcyQgmmNKaSFc6lgXLoxGNHaZkBMmI2CfdPHRCOo8bBHaEQazyR8Bib8KWyvt4xXGvuhBLR65BMg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=peDMvXcR; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=bot+bpf-ci@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=peDMvXcR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=bot+bpf-ci@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fQH7f4wQJz30Lw
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Mar 2026 00:43:26 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2B5B94025C;
	Tue,  3 Mar 2026 13:43:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFEFDC19422;
	Tue,  3 Mar 2026 13:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772545404;
	bh=F80gOnZg8UNeAX2i8hgqbTMYPyiikA8qMzpFtb0BmHY=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date:From;
	b=peDMvXcRudFi64iepmVQDQab3sU82tjtA3v+K7PXodgSrlJUjyn9KHldEYenfMbel
	 f04hnZlmA44lhAyHRBL3Gm+pApmpG4jgOFRvI6nVFf8y5gLsJrEh0MpY7ERUns/rZr
	 xWmlmXFtQgjovXeHDjtsinUNJgJqLKM7qKHoMfQd8AOBr9KR/mg9BO1oNHzYNt2x8V
	 lYKMrewG7TdIU0rkRRJw8uEwQ409uHIc5S4GgTH4n3RHdOctyaLdEKll4itFqbCKR8
	 +m3yYsGRN56FZ4AM0a/uY4TaGACKgOG4LDmY65Jz5GY6DK2EjGMA4JE4mwcMhogTGK
	 mXYkpwb0gLf8A==
Content-Type: multipart/mixed; boundary="===============6513310970023974767=="
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
Message-Id: <10122558b739e833e2a1def0e0de2861be87f53d51b8857c7085ddb5f6057a86@mail.kernel.org>
In-Reply-To: <20260303130208.325249-7-hbathini@linux.ibm.com>
References: <20260303130208.325249-7-hbathini@linux.ibm.com>
Subject: Re: [PATCH v3 6/6] powerpc64/bpf: fix kfunc call support
From: bot+bpf-ci@kernel.org
To: hbathini@linux.ibm.com,linuxppc-dev@lists.ozlabs.org
Cc: bpf@vger.kernel.org,maddy@linux.ibm.com,ast@kernel.org,daniel@iogearbox.net,andrii@kernel.org,skb99@linux.ibm.com,adubey@linux.ibm.com,venkat88@linux.ibm.com,stable@vger.kernel.org,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,clm@meta.com,ihor.solodrai@linux.dev
Date: Tue,  3 Mar 2026 13:43:22 +0000 (UTC)
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 123601F08B6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.21 / 15.00];
	CTYPE_MIXED_BOGUS(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-17570-lists,linuxppc-dev=lfdr.de,bpf-ci];
	FREEMAIL_CC(0.00)[vger.kernel.org,linux.ibm.com,kernel.org,iogearbox.net,gmail.com,linux.dev,meta.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bot@kernel.org,linuxppc-dev@lists.ozlabs.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[bot@kernel.org,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+,1:+];
	FORGED_RECIPIENTS(0.00)[m:hbathini@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:bpf@vger.kernel.org,m:maddy@linux.ibm.com,m:ast@kernel.org,m:daniel@iogearbox.net,m:andrii@kernel.org,m:skb99@linux.ibm.com,m:adubey@linux.ibm.com,m:venkat88@linux.ibm.com,m:stable@vger.kernel.org,m:martin.lau@kernel.org,m:eddyz87@gmail.com,m:yonghong.song@linux.dev,m:clm@meta.com,m:ihor.solodrai@linux.dev,s:lists@lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.994];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo,mail.kernel.org:mid]
X-Rspamd-Action: no action

--===============6513310970023974767==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
> index 04e76440d1ad..3a6bd12eecfd 100644
> --- a/arch/powerpc/net/bpf_jit_comp64.c
> +++ b/arch/powerpc/net/bpf_jit_comp64.c

[ ... ]

> +static int zero_extend(u32 *image, struct codegen_context *ctx, u32 src_reg, u32 dst_reg, u32 size)
> +{
> +	switch (size) {
> +	case 1:
> +		 /* zero-extend 8 bits into 64 bits */
> +		EMIT(PPC_RAW_RLDICL(dst_reg, dst_reg, 0, 56));
                                           ^^^^^^^
Should this second dst_reg be src_reg instead?

PPC_RAW_RLDICL(d, a, i, mb) takes d as the destination (RA) and a as
the source (RS). All three cases here pass dst_reg as both the source
and destination operand, which means the src_reg parameter is unused.

The companion sign_extend() function in the same patch correctly uses
both parameters:

    EMIT(PPC_RAW_EXTSB(dst_reg, src_reg));

Currently prepare_for_kfunc_call() always passes the same register for
both src and dst, so the generated code is correct. But the function
signature accepts src_reg without using it, which is inconsistent with
sign_extend() and would silently produce wrong code if a future caller
passes different registers.

> +		return 0;
> +	case 2:
> +		 /* zero-extend 16 bits into 64 bits */
> +		EMIT(PPC_RAW_RLDICL(dst_reg, dst_reg, 0, 48));
> +		return 0;
> +	case 4:
> +		 /* zero-extend 32 bits into 64 bits */
> +		EMIT(PPC_RAW_RLDICL(dst_reg, dst_reg, 0, 32));

Same issue in cases 2 and 4.

> +		fallthrough;
> +	case 8:
> +		/* Nothing to do */
> +		return 0;
> +	default:
> +		return -1;
> +	}
> +}


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/22624805528
--===============6513310970023974767==--


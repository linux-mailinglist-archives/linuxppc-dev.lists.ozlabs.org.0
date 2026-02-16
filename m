Return-Path: <linuxppc-dev+bounces-16875-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YCTRN/3JkmnPxwEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16875-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Feb 2026 08:40:45 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A9014151F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Feb 2026 08:40:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fDvp24KhQz2ySS;
	Mon, 16 Feb 2026 18:40:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771227642;
	cv=none; b=jmho70PCMzQvRaJ0+xlsqyYHNm9sOizJUYxmj3ZI/f74v8yKZip5JqvscH+YWa8/HNf4Oe5gJunstAmVwUC1/I5K26eSXKWepQewaPAttIMK10wR9TNtz+QtTtGzZ8SkWSFhYCHR59KC0XLI4WSzzOgXlGqm6fmDko6ZnGo3Cxn7lxl6TfIWKyxEZIZjZkfmMLHMXfyoXpSFv2Ck7ClryPxMntoOB0ZQRJTNM2cPES+OXxPVpjoLn4Nwed8fQoSY+ulv5Ag30G1MNna90M6uRsrSamXjsjDNvx2KX/03Rxh6U9/KHQZpLRm05e/QUcoQSE1R3zdLtofA93KxITZz+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771227642; c=relaxed/relaxed;
	bh=mGodHb8dpKK3JImf1CKTH7p6k3V7r9Y5Tj5mlLe0S5s=;
	h=Content-Type:MIME-Version:Message-Id:In-Reply-To:References:
	 Subject:From:To:Cc:Date; b=OnsrYHdvzs3IPkwxC/kW+ik5C+J+1wregh1taFVeMFYBMfYDv+pgL0yQP+SnR50QyTTBtRzjMMmueLEWVXdeAjxyWif3/ylC/mibwb0DDhTYLAXcXeAwEcke+bBjS/7yU2yYmDkf8trdPaKJZBRq4urj/B68sTsrI8LAlJzu4z6wlfrn96EtTTwyrfgrzedhEyoSjyT81/Ut3NmnRUKKqcJQglMTg4jGTxdX4M3y5oJl1Khf3mvqsOwrlZ9l9Zl2fzG4Gh5MV+dWaA8c1pz7VXQc6IJIp05dpYq3RXcdfzllq7GAtz1ESulVtypEOr5ssR+VSjQ58iqXdblgAzpN7w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IzEJnSJa; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=bot+bpf-ci@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IzEJnSJa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=bot+bpf-ci@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fDvp13pfVz2xN4
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Feb 2026 18:40:41 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7B359600BB;
	Mon, 16 Feb 2026 07:40:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF38BC116C6;
	Mon, 16 Feb 2026 07:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771227639;
	bh=YFOf7AKprHvDPCY9j8wl9hPwmTggebXDjHUk82eHMKQ=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date:From;
	b=IzEJnSJaUzMQkB6A9mEBX19Emxjz3FaKAu/TxYp8xkXFl1kzcwlMxGTen9qMmwVtk
	 5S5mmZ1b6217YMXhKoa23Z4MMkIO9hs9OSO6IdQYHF442zGQOFLvhKFV6dvc1zmeXz
	 kBY8uSZX/7s858aOmZLvPqxR15MagXhvY0INfBJbXi3eErpTT3o4AlyEXnHKE5Z4DT
	 V7twneerEpnDrDiNz2QXgahJjs7YDf8Zpt3eUEXJ3iQ4e55Vt9MvctmWon8ePeQyEC
	 W9nuMIPorrIri4lB2jlI9eBV4wln1GKuWL9R6EFCGFRT0Mi9t0z3uLjnRxc+CFhdWY
	 O8SxaYuw9WhcA==
Content-Type: multipart/mixed; boundary="===============5622546097200743244=="
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
Message-Id: <5f92f12e74b1c8d6fa54ec72590d5087a3c8b7ac2d7302309936db6bd196f5cc@mail.kernel.org>
In-Reply-To: <20260216065639.1750181-6-hbathini@linux.ibm.com>
References: <20260216065639.1750181-6-hbathini@linux.ibm.com>
Subject: Re: [PATCH 5/5] powerpc64/bpf: fix handling of BPF stack in exception callback
From: bot+bpf-ci@kernel.org
To: hbathini@linux.ibm.com,linuxppc-dev@lists.ozlabs.org
Cc: bpf@vger.kernel.org,ast@kernel.org,daniel@iogearbox.net,andrii@kernel.org,skb99@linux.ibm.com,adubey@linux.ibm.com,bot+bpf-ci@kernel.org,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,clm@meta.com,ihor.solodrai@linux.dev
Date: Mon, 16 Feb 2026 07:40:38 +0000 (UTC)
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	CTYPE_MIXED_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-16875-lists,linuxppc-dev=lfdr.de,bpf-ci];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,iogearbox.net,linux.ibm.com,gmail.com,linux.dev,meta.com];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[bot@kernel.org,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+,1:+];
	FORGED_RECIPIENTS(0.00)[m:hbathini@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:bpf@vger.kernel.org,m:ast@kernel.org,m:daniel@iogearbox.net,m:andrii@kernel.org,m:skb99@linux.ibm.com,m:adubey@linux.ibm.com,m:bot+bpf-ci@kernel.org,m:martin.lau@kernel.org,m:eddyz87@gmail.com,m:yonghong.song@linux.dev,m:clm@meta.com,m:ihor.solodrai@linux.dev,m:bot@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_NEQ_ENVFROM(0.00)[bot@kernel.org,linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev,bpf-ci];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: F1A9014151F
X-Rspamd-Action: no action

--===============5622546097200743244==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
> --- a/arch/powerpc/net/bpf_jit_comp64.c
> +++ b/arch/powerpc/net/bpf_jit_comp64.c

[ ... ]

> @@ -287,6 +285,22 @@
>  		 * program(main prog) as third arg
>  		 */
>  		EMIT(PPC_RAW_MR(_R1, _R5));
> +		/*
> +		 * Exception callback reuses the stack frame of exception boundary.
> +		 * But BPF stack depth of exception callback and exception boundary
> +		 * don't have to be same. If BPF stack depth is different, adjust the
> +		 * stack frame size considering BPF stack depth of exception callback.
> +		 * The non-volatile register save area remains unchanged. These non-
> +		 * volatile registers are restored in exception callback's epilogue.
> +		 */
> +		EMIT(PPC_RAW_LD(bpf_to_ppc(TMP_REG_1), _R5, 0));
> +		EMIT(PPC_RAW_SUB(bpf_to_ppc(TMP_REG_2), _R1, bpf_to_ppc(TMP_REG_1)));

Are the operands to PPC_RAW_SUB reversed here? At this point R1 holds
boundary_sp (set by the MR above) and TMP_REG_1 holds prev_sp (loaded
from [R5+0]). Since the stack grows downward, boundary_sp < prev_sp.

PPC_RAW_SUB(d, a, b) computes d = a - b, confirmed by how BPF_SUB is
emitted in bpf_jit_build_body():

    case BPF_ALU64 | BPF_SUB | BPF_X: /* dst -= src */
        EMIT(PPC_RAW_SUB(dst_reg, dst_reg, src_reg));

So this computes TMP_REG_2 = R1 - TMP_REG_1 = boundary_sp - prev_sp,
which is a negative value. After the ADDI subtracts BPF_PPC_EXC_STACKFRAME,
the result is still negative (a large unsigned value near 2^64).

The subsequent CMPLDI unsigned comparison against ctx->stack_size (at
most 512) can therefore never be equal, making the conditional branch
dead code. The fallthrough path always creates a new frame.

The intended computation appears to be
prev_sp - boundary_sp = frame_size, which requires swapping the
operands:

    EMIT(PPC_RAW_SUB(bpf_to_ppc(TMP_REG_2),
                     bpf_to_ppc(TMP_REG_1), _R1));

The code still works because always creating a new frame from prev_sp
produces correct NVR offsets, but the optimization to skip re-framing
when stack depths match never fires.

> +		EMIT(PPC_RAW_ADDI(bpf_to_ppc(TMP_REG_2), bpf_to_ppc(TMP_REG_2),
> +			-BPF_PPC_EXC_STACKFRAME));
> +		EMIT(PPC_RAW_CMPLDI(bpf_to_ppc(TMP_REG_2), ctx->stack_size));
> +		PPC_BCC_CONST_SHORT(COND_EQ, 12);
> +		EMIT(PPC_RAW_MR(_R1, bpf_to_ppc(TMP_REG_1)));
> +		EMIT(PPC_RAW_STDU(_R1, _R1, -(BPF_PPC_EXC_STACKFRAME + ctx->stack_size)));
>  	}


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/22053464899

AI-authorship-score: low
AI-authorship-explanation: The commit demonstrates deep domain knowledge of powerpc64 BPF JIT internals and the operand swap bug is characteristic of human error with the non-intuitive PPC_RAW_SUB macro.
issues-found: 1
issue-severity-score: low
issue-severity-explanation: The PPC_RAW_SUB operands are swapped making the stack size comparison dead code, but the fallthrough path always creates a correct frame so there is no crash or data corruption.

--===============5622546097200743244==--


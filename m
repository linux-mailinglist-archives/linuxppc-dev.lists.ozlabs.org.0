Return-Path: <linuxppc-dev+bounces-8296-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 79560AA9388
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 May 2025 14:46:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zrh9R0Fc2z2yqm;
	Mon,  5 May 2025 22:46:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=23.83.223.164 arc.chain=mailchannels.net
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746449194;
	cv=pass; b=kDDc1crhBVWGzXt2R/gaYQi6BIQYMXCl/CJn7+nkE/DOHxrC8/tDv1nVEPNzZzllrBrQJX+D+Tx+i+MoSMJbPB/Bf9a26Zd6F+QiuyRfHZ2bT+AmR3gkVV0aVW6HxMEjGqQX8BV072oQ1k6Fq6fUK9Tyk0LI5SrViEVDvUVr98ujPoB1kPzHBKE2yw9cBauNniB53td7haVECuS0C/uzHZBKMMTXG/9CeXfsqOpAWyTiflwzfBpC2U9Wgruu8M1JbsEfXzyTPLsEOiiqcY9U9/tinegcPAyHYo44UhdMn/fL7eESQaDeLcP/7yNkKaWYbAWivphhLwFU4eYrhOaEFw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746449194; c=relaxed/relaxed;
	bh=FH2fG34MlZYKx5e7jmuoiXADMpRcIcNhlCpltkFibWI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=oKh/t9qfwoG//5OZY4VFoSv7oy0Qg40vDWwpMBGw40i63hycFpfeAHsx1hC6Kpx7I+HXF90Ph9U77eXvJ5ONgsXnJ9acJO+2pYO78az6JnmBycHsOTitHIitXlcEZ8cvKdcsHeSYbk7z6+BbwCnPQGTY1R3B2QGU2xTSE0BkZdPM2DT8+Q7TrpeltQNeuCz6bT9neV1mfzgVxhVYztLsMhdJ5anT63YvdTqeM3qEkyGryi9H9N2D2LK26zIWndCwqIg1+7Ozh82YYOECB2lVQRmZ4QK0MQ6kNCY2vnjjLXhQk9X0Frq/w8iGDOZZ2xNZQfEBCMeSGb5ju2Rs/KcaOg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=ascii.art.br; dkim=pass (2048-bit key; unprotected) header.d=ascii.art.br header.i=@ascii.art.br header.a=rsa-sha256 header.s=dreamhost header.b=Zb0aViTG; dkim-atps=neutral; spf=pass (client-ip=23.83.223.164; helo=shrimp.cherry.relay.mailchannels.net; envelope-from=tuliom@ascii.art.br; receiver=lists.ozlabs.org) smtp.mailfrom=ascii.art.br
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=ascii.art.br
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ascii.art.br header.i=@ascii.art.br header.a=rsa-sha256 header.s=dreamhost header.b=Zb0aViTG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ascii.art.br (client-ip=23.83.223.164; helo=shrimp.cherry.relay.mailchannels.net; envelope-from=tuliom@ascii.art.br; receiver=lists.ozlabs.org)
Received: from shrimp.cherry.relay.mailchannels.net (shrimp.cherry.relay.mailchannels.net [23.83.223.164])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zrh9M2Sfzz2xd6
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 May 2025 22:46:29 +1000 (AEST)
X-Sender-Id: dreamhost|x-authsender|tuliom@ascii.art.br
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 56AE7322B5A
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 May 2025 12:44:15 +0000 (UTC)
Received: from pdx1-sub0-mail-a210.dreamhost.com (100-106-214-82.trex-nlb.outbound.svc.cluster.local [100.106.214.82])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id A8444322B91
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 May 2025 12:44:14 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1746449054; a=rsa-sha256;
	cv=none;
	b=5dkHGT5o7KsAHEE1if3NFKyuMCcx+/qSzQuIgE5NK7hlywF5f9iRzo2BxEg+gaNz4dScT/
	+JOnlkPQuVb8qK82dKfWJEcMn3Hv3aSXte2qlH1eXLum0zQ70MofbItnSqn6K40VymumHY
	8CUHpW2zPr5c+a60PSbwm2uHIX5g5QQ/DHAbwTdWHeZsEBXG6nguCcEENeQ0Bj/UhRB5KT
	i6at17Eg4lp7LoB6fv94lmaW1qtz0f7i3EHxWafU+glYR3HUJiPuQbyZzn3sVjDjfeoN+M
	BUOGvodku+uptO8wxggTo1smTeM+thO2xX/kBE2iQ35D0YSrCj38mpy1DaxkLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1746449054;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 dkim-signature; bh=FH2fG34MlZYKx5e7jmuoiXADMpRcIcNhlCpltkFibWI=;
	b=JeYA1jmC+rEBP/U1aYj/MHEb6obgFF0J6ENcH3IcUJ2IWNVk2nSzfbEekn1HrRRgCli+2t
	v0nO2QTleJEm96KHjOmvVnGoyr7OINS6rsSopPW2C+a0d0c+DxgAYvjcqL32D0f28eRZnN
	+CwB5dABNPS9+Oo6+P45j0FTPDH1BZpEV8KWhE2PobqfeoYYksdxz2p6nSVlzP1fzeEq/J
	iR9ZJnLJfo+aOKmrDBepEjbcHP+1uPURe9tiCc0rAZGkLelmYbWOLZ+jKO1Xoj8cwP/On2
	dsl1UrTMGzKoyvxl6Ke8OAgUx5YBHlwjs3Qyvq26a5q31ckFXuOZFm0euGbeBQ==
ARC-Authentication-Results: i=1;
	rspamd-56c68c6fd9-cwb97;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=tuliom@ascii.art.br
X-Sender-Id: dreamhost|x-authsender|tuliom@ascii.art.br
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|tuliom@ascii.art.br
X-MailChannels-Auth-Id: dreamhost
X-Descriptive-Robust: 2c8cee6541dda0a3_1746449055153_1875921552
X-MC-Loop-Signature: 1746449055153:1420688729
X-MC-Ingress-Time: 1746449055153
Received: from pdx1-sub0-mail-a210.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.106.214.82 (trex/7.0.3);
	Mon, 05 May 2025 12:44:15 +0000
Received: from ascii.art.br (ip-187-108-54-97.isp.valenet.com.br [187.108.54.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: tuliom@ascii.art.br)
	by pdx1-sub0-mail-a210.dreamhost.com (Postfix) with ESMTPSA id 4Zrh6k0VcFz6t
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 May 2025 05:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ascii.art.br;
	s=dreamhost; t=1746449054;
	bh=FH2fG34MlZYKx5e7jmuoiXADMpRcIcNhlCpltkFibWI=;
	h=From:To:Cc:Subject:Date:Content-Type;
	b=Zb0aViTGYYnW3gL/aLD9Xw1WicdKNFAOQSHsJ4ou7Mmn/uAs7o4ANCIi0rbzYYkHo
	 7iHHMDC8LSypWUzcX10eEqT7bbVbgMfvVjKsh5qrJNhj1Pwvb/DVv214bqaquMkOKL
	 gRNq5Mp+A66j1PyDWxwSwm6P/ptPd1+JItCaS5rqUhMJ/a7SfO4VwWK/XoIk0u4e0a
	 TQ+sRCw86PwJpAghz+gqp/RpYDHRFdg565Jutp4hzGuzbyO0lpvjV7RerLPc4ml/EJ
	 n8093v3GBfogVZhkcQKSfuKYSGjVFGNYWvzcVTDSUcaKgxh5cwfS/nDf54qW6bLpmh
	 sQgIy9/extSxQ==
From: Tulio Magno Quites Machado Filho <tuliom@ascii.art.br>
To: linuxppc-dev@lists.ozlabs.org
Cc: 
Subject: Bug: Issue in ioctls.h affecting userspace
Date: Mon, 05 May 2025 09:44:10 -0300
Message-ID: <8734dji5wl.fsf@ascii.art.br>
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
Content-Type: text/plain
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Heads up: a recent glibc change exposed an issue in the powerpc-specifi
ioctls.h [1].

Userspace projects like Python, LLVM and GCC [2] can't build on ppc64le now.

Suggestions with temporary workarounds are welcome!

[1] https://github.com/linuxppc/issues/issues/488
[2] https://bugzilla.redhat.com/show_bug.cgi?id=2363674

-- 
Tulio Magno


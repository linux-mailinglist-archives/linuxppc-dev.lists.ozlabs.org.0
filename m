Return-Path: <linuxppc-dev+bounces-6040-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D408A2F537
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Feb 2025 18:26:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YsBMY0jCBz305C;
	Tue, 11 Feb 2025 04:26:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739208409;
	cv=none; b=Z5DVeijpe30CRbfdK/EeOsICbIKuU3W0N+OwlwWL+s00BmPpTqXST7t3FLxAAPhO3NtJofwUtGsltYH0kbLsY+rJILe39CsHXlu/PWU0aOga4+yGYPLiHdB+TriB9NVxghob8oec3Trwys7kjzZX5KykSMdP4yae2Q281rqQKqgrEch4jYgyFCNEYZOZv/nrv5JfkEmY3lQGL9HS1Q1c+Mzg5MRMoyCxA0K4iIUbahl8EAdDN9l+alDPFQvitWdgDXGEqF6H+/kzE0lZ39vNL1vC2SnCByB0RZSqyGLNqzdeCKULLfUd2YKbBbaSP30wVWixRGUbfzhwC8SrpBJPTA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739208409; c=relaxed/relaxed;
	bh=EX4g7Zew3KAmdBTGBpPCS5Fca46ZmDFoJVHFb5sjoSE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eNozCcfap7E4rfAQAZ3lYxEBT4TRPsH9+ox6eP+0rGTf/HU7FYH8k4Ee1fqTbYkmN/GtwcwzVBwDAbKejrwUT7V1io0Z2/ItEl6eJDXK8vriDiNWneXyc8QTlyABT8U5H7l6JP/uruY7ZTzjmw53WvEbyEQtLbTOL8pgu6ZWq39uvgOM0ZPU1g5gREZ1fNQ352Mb4cufuZk52zvkc8ZeB4g+9Mcg5M11EKwyegrxsfh6Y0YD8rpImc8GucCuQVsMrIjSDHO+xRkjg34oe75Rxtzz5IL+lhbc9kRzSqHdzB/k29iRnT6W4huAvS1aVMk3iMCRReoC+b7Qw0d5/S66vg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Nv1DEaqX; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=kees@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Nv1DEaqX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=kees@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YsBMX1ksdz2yMh
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Feb 2025 04:26:48 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 60A845C5D1D;
	Mon, 10 Feb 2025 17:26:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0538C4CEE5;
	Mon, 10 Feb 2025 17:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739208405;
	bh=dFdEHV64PvXwM88HiXG36orj35kREPl+pEZLrcC9Wik=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Nv1DEaqXgCu7T95cZlvPA1HzDZyY0C8Qb280GPlm4LSzoC6CTwRBjetDPxF6rJk8P
	 tAtMaioVFv/UacMfiAXJfUNBYJGMmik1IJ1TL+1XRVqH3i2wK3vtH1okBWXn4GKUDD
	 /iOKDjBZuaOC+Mf9GKQRK4AtGBUTp04R4KuNCB4GJLjdZ+G4QiYzbMooXF0xrJNUPx
	 q38Asjoumb6CtMpzpuvlr+WNUTROHSJEDuvmj7THYwM8F5cbZuWtmv2LLV2Q7vgCrJ
	 IyQlx50dRG/836JAZsxnUfi1/e5oygmotS4G9ax+PuLpdgQhLloJF2VPncr1vlVwi3
	 1ua5yuODlCU5w==
From: Kees Cook <kees@kernel.org>
To: Andy Lutomirski <luto@amacapital.net>,
	Will Drewry <wad@chromium.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Oleg Nesterov <oleg@redhat.com>
Cc: Kees Cook <kees@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 0/4] seccomp: remove the 'sd' argument from __secure_computing()
Date: Mon, 10 Feb 2025 09:26:37 -0800
Message-Id: <173920839501.2521863.14260779876431853606.b4-ty@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250128150228.GA15298@redhat.com>
References: <20250128150228.GA15298@redhat.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, 28 Jan 2025 16:02:28 +0100, Oleg Nesterov wrote:
> Link to v1: https://lore.kernel.org/all/20250120134409.GA21241@redhat.com/
> Only 2/4 was changed, please see interdiff at the end.
> 
> I've included the acks I got on 1/4, 3/4, and 4/4 (thanks!).
> 
> Oleg.
> 
> [...]

Applied to for-next/seccomp, thanks!

[0/4] seccomp: remove the 'sd' argument from __secure_computing()
      https://git.kernel.org/kees/c/1027cd8084bb
[1/4] seccomp/mips: change syscall_trace_enter() to use secure_computing()
      https://git.kernel.org/kees/c/0fe1ebf3f056
[2/4] seccomp: fix the __secure_computing() stub for !HAVE_ARCH_SECCOMP_FILTER
      https://git.kernel.org/kees/c/b37778bec82b
[3/4] seccomp: remove the 'sd' argument from __secure_computing()
      https://git.kernel.org/kees/c/1027cd8084bb
[4/4] seccomp: remove the 'sd' argument from __seccomp_filter()
      https://git.kernel.org/kees/c/e1cec5107c39

Take care,

-- 
Kees Cook



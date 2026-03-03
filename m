Return-Path: <linuxppc-dev+bounces-17621-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +PCDOJcwp2mbfgAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17621-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Mar 2026 20:03:51 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 842001F59BA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Mar 2026 20:03:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fQQFH2693z3bt7;
	Wed, 04 Mar 2026 06:03:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::54a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772564627;
	cv=none; b=P++t9Ye2dOdDOqGWXQBVTn6FvM6erLnt+1wuu3zvdpfcILaAI9TALQ4K2g9DUU+g2/lhQWyr57xtzqF468paAUb0Acq5UD0Cj1v55CskqbdC7n48GPub1dHE/rn+hxalFZ8m0t+fbI29ZlZI2mIHeXrAT2DK83Qkz4ZVsijA8M82PrJoJxdQ8qITFZZftBBsyBQMUUFcmsSytXW5DO9e/2iouauUDi7Gop4nKUF74nB4gnMey/yCwCsa8CsPMBaQT0idG5YyVI+NC7HLS29Pogs05eOcdrmwplykZMliWSiDAsxys82gCCugqZJn+n+qDh4fPHIIx5UNX6ITcsml7A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772564627; c=relaxed/relaxed;
	bh=7HYEqbzPxihlsLjR6JkXJkRv7dD7WWhUy1nb4kzntSw=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=gL9HBrKItT64po7qabPLKqvj2CrjBJwABSxp9gW4D49WFuwmaRDNpUsPcUyPYMLvTQldO342wIhB1ZUzS8LOTIGcXc2cajbvdldo7ERbvyds2bAdk70tnF8REZoGpnVTvtosMFTQu36cwQPbWAeapBpSWjz55SfN8nSr+Y9mYTHtigY2lUYme5zZOJ6h6cXipgpDeVHQXM7O/mm9rpuURGWmiSdAa/RiQ1cu/bL03rSw42EoJxVzOtUykP0O/37yrhE0IXH5af+UOCFdBmmlMq3kQ2QEfTkK5e1/I2jwimvRbTBYf/mVJW6wzI4FCEkZ3AYq/2pNo+wWfCJozk+7Og==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=TMrzzQu0; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::54a; helo=mail-pg1-x54a.google.com; envelope-from=3jjcnaqykdn8tfbokdhpphmf.dpnmjovyqqd-efwmjtut.pambct.psh@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=TMrzzQu0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::54a; helo=mail-pg1-x54a.google.com; envelope-from=3jjcnaqykdn8tfbokdhpphmf.dpnmjovyqqd-efwmjtut.pambct.psh@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com [IPv6:2607:f8b0:4864:20::54a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fQQFF4Sk8z3bnr
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Mar 2026 06:03:45 +1100 (AEDT)
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-c70efa3b730so3346235a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Mar 2026 11:03:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772564622; x=1773169422; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7HYEqbzPxihlsLjR6JkXJkRv7dD7WWhUy1nb4kzntSw=;
        b=TMrzzQu0Z5XskyqqJGDBOFvYbsMBmrJtG0MBZjCwe2FFkfMpJh+m770ZgB/yNKNZKs
         4Ic3xJCeYaCLrqlgbqkUvw6D8oEmr6oEq5LwTQrxwQnFlnbRhdtXmGt360xTpWGfEfez
         mOnvJ7qgCyp41He1wvewp8D1t3mg+kHTRRQudg6z3yrfzeUM+ceDUt+2ZcjcRdJ67Oby
         R8D+CLOKsQK7AyEV8O1zhdcUIOdc1o6PvThthbBhZXOof3zbGDPEwVvEdRnu3kNm980z
         qdBrlxkA0VwWCp30atrsdzyAv4bnYX7l4RlRcCSuz6ktHFazRXXljNI16i9lKvDnEU+O
         qx3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772564622; x=1773169422;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7HYEqbzPxihlsLjR6JkXJkRv7dD7WWhUy1nb4kzntSw=;
        b=lwh1qg+WTBwBN2t/ZDUe3yKB+W4XXIQctYnWVkdueLqqYg9fMlKh5b9KCGisXKxGcU
         5wtXVwpIzGazOqetvsIZFQohBOibtFtXghBVhjcm11zxZx8QuyjMIOQjvQMTrlTiWiWp
         +/BlH7BaZ7dK9vGuIzqcg3tJlVw7Vm+l4VFaGe2HCkcQoJa5R/em5UiSwWl/ZwwM08rq
         0Z2KgWO0W123E1zrL3bUo4mCflodT0O8tQA0fwxnDZ6twoDxg37PkPXywGXMB4kNdEYh
         wD4Zkco2bLBclrT36X77TmgErpSzsck4TlvPNIIhnzvq4PHqVn7rv4cTV3558/dgJHBm
         y2Pw==
X-Gm-Message-State: AOJu0Yz/7TmriR7+nQVArWh9FAN8PNIgO8LCEIRigAhnFjQN7hhjxDr1
	nLINnOMeFMGZ3wrlvb4SXe0+SLsoog5DqR0jVr8tOlhwNHZwbo/VKSX0QjQVmIPtXpkRU1aqLRd
	5dc7M7w==
X-Received: from pgvt6.prod.google.com ([2002:a65:64c6:0:b0:c6e:698a:f5c0])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:44c8:b0:38e:54b8:60a1
 with SMTP id adf61e73a8af0-395c39de56amr15737423637.4.1772564622253; Tue, 03
 Mar 2026 11:03:42 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue,  3 Mar 2026 11:03:37 -0800
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
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <20260303190339.974325-1-seanjc@google.com>
Subject: [PATCH 0/2] KVM: PPC: e500: Fix build error due to crappy KVM code
From: Sean Christopherson <seanjc@google.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Kees Cook <kees@kernel.org>, 
	Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.6 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 842001F59BA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17621-lists,linuxppc-dev=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:maddy@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kees@kernel.org,m:seanjc@google.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[seanjc@google.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	HAS_REPLYTO(0.00)[seanjc@google.com];
	FROM_NEQ_ENVFROM(0.00)[seanjc@google.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[google.com:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Action: no action

Fix an e500 build error that was introduced by the recent kmalloc_obj()
conversion, but in reality is due to crappy KVM code that has existed for
~13 years.

I'm taking this through kvm-x86 fixes, because it's breaking my testing setup,
and obviously no one cares about KVM e500 since PPC_WERROR is default 'y' and
needs to be explicitly disabled via PPC_DISABLE_WERROR.

Sean Christopherson (2):
  KVM: PPC: e500: Fix build error due to using kmalloc_obj() with wrong
    type
  KVM: PPC: e500: Rip out "struct tlbe_ref"

 arch/powerpc/kvm/e500.h          |  6 +--
 arch/powerpc/kvm/e500_mmu.c      |  4 +-
 arch/powerpc/kvm/e500_mmu_host.c | 91 +++++++++++++++-----------------
 3 files changed, 47 insertions(+), 54 deletions(-)


base-commit: 11439c4635edd669ae435eec308f4ab8a0804808
-- 
2.53.0.473.g4a7958ca14-goog



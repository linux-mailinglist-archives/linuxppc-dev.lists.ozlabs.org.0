Return-Path: <linuxppc-dev+bounces-10632-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D35B1AE1F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Aug 2025 08:20:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bx3Ff2bfxz3bh6;
	Tue,  5 Aug 2025 16:20:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.236.30
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754374838;
	cv=none; b=XLSjQYKuKoTVZ2HtrAclC5giUgxlh9SIICsv2rutWISIA1GoNG7WoK4ewiUMFozjXus+Kveq7Nl8VkBwamcG8Hqfz0AiCudrvLeiBYjGi+/cKJKxxl3J+psU6rHTHsDZ8grNEgJBwb9VOfUXpj9rKGF0rRsAL5Sm533jFmD0Pq92Z457DJ3PwpwsU39hfy19Qx8NCQkWvUgct1Bd4bOl1WPTIwWbGj4U9Q7eZ5tlIlaLCM2vQDswxv2kIuuNsKCCTvj+YPQNrQO5BkP0YrPMwFnfy7+EFRVRrEmhMMdgfLocgWlQaohtwHcJABB/oF1s8C56CjvdlvX0cAZpdmMM5w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754374838; c=relaxed/relaxed;
	bh=AU/+bRWDSsKTmeZAkeRUf9ONAt1YyMXjt4VLPAYynrY=;
	h=Message-ID:Date:MIME-Version:From:To:Cc:Subject:Content-Type; b=oDyr9dTSkVwcByEq3lZk6SKsKz33MvaQnPzvXiXFZ/Olanw9tzPKJx+e5bm+jm3e39EqVRrneAGOES9+INS7+6ZxDny5l85jU/+cc0g7V5FJdXEFqhGhbn7aiqa4GjxnoajleFicFuOQuvpEoQ9PKNsi4LlNOjzLKMpM6Hs1QscNQ3mlGwGa+4tZHrNYkhzIisncpy5i30E5tAjZsy7Kl1Qd/UThIY8h3E5iNXKvb5QAqNLUwBEK1wjztkEsTh8nzLduzplqEn9S343L73+BX8IzaFnQDTuJmZaD7jGyRoKkssJEJa6Q1dmGVwLF/9NMrrpB+ZopGtoFz4VRgpnYbw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bx3Fd5GKPz30WY
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Aug 2025 16:20:35 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bx2tF6Nrjz9sFT;
	Tue,  5 Aug 2025 08:03:49 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fwMz0SDajMtN; Tue,  5 Aug 2025 08:03:49 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bx2tF5gtkz9sD3;
	Tue,  5 Aug 2025 08:03:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id BEF698B765;
	Tue,  5 Aug 2025 08:03:49 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id V3D-rJziP3v6; Tue,  5 Aug 2025 08:03:49 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 8B9418B763;
	Tue,  5 Aug 2025 08:03:49 +0200 (CEST)
Message-ID: <7240379a-176f-4187-a353-1e6b68a359ce@csgroup.eu>
Date: Tue, 5 Aug 2025 08:03:49 +0200
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
User-Agent: Mozilla Thunderbird
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-stable <stable@vger.kernel.org>
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Apply commit 5a821e2d69e2 ("powerpc/boot: Fix build with gcc 15") to
 stable kernels
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi,

Could you please apply commit 5a821e2d69e2 ("powerpc/boot: Fix build 
with gcc 15") to stable kernels, just like you did with commit 
ee2ab467bddf ("x86/boot: Use '-std=gnu11' to fix build with GCC 15")

Ref: https://bugzilla.kernel.org/show_bug.cgi?id=220407

Thanks
Christophe



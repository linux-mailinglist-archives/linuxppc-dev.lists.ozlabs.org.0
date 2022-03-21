Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2783F4E2387
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Mar 2022 10:44:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KMV7Z0dnTz30KR
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Mar 2022 20:44:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=P35PEYaP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=out5-smtp.messagingengine.com (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=fthain@linux-m68k.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=P35PEYaP; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KMV6s40xrz3071
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Mar 2022 20:43:30 +1100 (AEDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 380C25C01BA;
 Mon, 21 Mar 2022 05:43:27 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 21 Mar 2022 05:43:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=4al7ncrz2EH9krhtX
 ccZlRXvPxg+S/0nxXh5Rkoyq/M=; b=P35PEYaP2EwbX9hvyT4jsC0kp/JO8pqeP
 rUr2NY/8BGi6bp8vSLfTUyTXOtSNWxIOxXxi6LHiVW68HIxCfmZfmi/2PR7enyr0
 rG0ZRsAgBVP3AcUF7T7MOuwpVY/cRHa/eCoDDDQwBRpImR/YkxSjWdwABxivoSUY
 pmjWzRcikPX+xTFCOdlvkxUkKQeDxepsZZ37et8YF1Ale2vAsrkpRUGVC5n56H9O
 t5PdsbYYazDHfYBj3d/3KvsrRH8n/C47uQBBaFM7Iy2K2RFTIQnJhqs9gpBhrClq
 xQejmuGRroH1t436tPDeFtwZyXpVCws3OFEa3Qc45mIj4AzVIkUgQ==
X-ME-Sender: <xms:vkg4YrGBynEALIXSL7jOsr7MsHkdf2I1qWJ-_4jNxPJy5mTzTe-d1w>
 <xme:vkg4YoVa4Lga-SXbvrJO-pPP7krF6p0ikywnyh-qSJVP05DBv2TS5UYpcHmgKE9t2
 qmd04MnYySpOA8Nrj0>
X-ME-Received: <xmr:vkg4YtJg1ggBGJ7U2AgUuc_3HmLNnJyz5DE5lntZjpTUEnBm-KnSG-0VIn5qaXu5YsRv9qvr8ZzP7HZzO4jknzOqFSweoRJQEaE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudegfedgtdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffujgfkfhggtgesthdtredttddtvdenucfhrhhomhephfhinhhnucfv
 hhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrfgrth
 htvghrnhepffduhfegfedvieetudfgleeugeehkeekfeevfffhieevteelvdfhtdevffet
 uedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepfh
 hthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:v0g4YpFRvwC5RggmTyKAAOFii9uBxblmQgP8lPBHWZmAPSptfTFpQg>
 <xmx:v0g4YhXFrWDlKoonCGVoOjqFjjf-Ny0xOGyGVmbrJgJodq4Cs3O7Gw>
 <xmx:v0g4YkNkUK9fptAP5E-dSuo_bVSKQNmGFcjlISESbJCpCPdSvLdcAg>
 <xmx:v0g4YgeenuCLGwD77GtrV0uwr4PQpY6qohtdjdx7O0KrIvbfBbeB9Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Mar 2022 05:43:25 -0400 (EDT)
Date: Mon, 21 Mar 2022 20:43:30 +1100 (AEDT)
From: Finn Thain <fthain@linux-m68k.org>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [PATCH] Subject: [PATCH] macintosh/via-pmu: Avoid compiler
 warnings when CONFIG_PROC_FS is disabled
In-Reply-To: <bb3b2229213f5feaff12e731b7537d03705e15d5.1647854173.git.fthain@linux-m68k.org>
Message-ID: <50b3865d-f23d-c4c2-2f41-7ec51cdb9e9a@linux-m68k.org>
References: <bb3b2229213f5feaff12e731b7537d03705e15d5.1647854173.git.fthain@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Randy Dunlap <rdunlap@infradead.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Please disregard. I'll send v2 with corrected commit log entry.

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A223198B84
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Mar 2020 07:03:05 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48rxzV3xxPzDqY7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Mar 2020 16:03:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=russell.cc (client-ip=66.111.4.229;
 helo=new3-smtp.messagingengine.com; envelope-from=ruscur@russell.cc;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=russell.cc
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256
 header.s=fm1 header.b=WTVQJnlW; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=rf5sU28a; 
 dkim-atps=neutral
X-Greylist: delayed 433 seconds by postgrey-1.36 at bilbo;
 Tue, 31 Mar 2020 15:56:03 AEDT
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48rxqR6vPvzDqsx
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Mar 2020 15:56:03 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 4089D58024C;
 Tue, 31 Mar 2020 00:48:45 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 31 Mar 2020 00:48:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=yY8X33qvg/yRwHhINvujWxa4XK
 uItnDDjdDahuZGPeg=; b=WTVQJnlWEiOA/heukWV5Hwoz7jZwL7h7p0pYQcCp4u
 2kvFvq08tkHLEQpc55+H1I+1MR8XbcuRw4/Ntpu5FHvzlhQLnu0J0yCYi/HyjQDX
 1km1XHQ2CfXzt42O5AR+EYPNiddupYpublxsN3CgyD98CFM7UT38yt2DqVSposHJ
 zd+EFm/zBnb1Xa7EwtyjDBbKauWLzVRErcyAIlapUXIvHewsBgXNjS9xMABz3kAC
 823ZS/b/34WeSSySGI29pE00KgC4R6Zr/UWga4MWzbBjnSk8seCqhPsYvjOBMRBY
 lqImRO3eoc18pldJ2njEkRbmMeP6kSeYb0P3Y/5/U2uw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=yY8X33qvg/yRwHhIN
 vujWxa4XKuItnDDjdDahuZGPeg=; b=rf5sU28amT7+teD62/QPQPQcdO+aAZURi
 4jrvcCHgCQacTOWvrAF+i8Oqnt/fjwtCw2eHhzBnyKHt1MAuFmk+nuIxLC3LLIy5
 gfb+lTs2AXq/IBSYY4bButzBAIAiHyz1Z75mNZV9HlR6yzQrPUIMV4XuFZrSFmBL
 bP3RlAA+hEL97vJP8+j5rcxwlgvkP0gLz3X2nBJcKYkcc2sW5bRT2smLsq6dkU8B
 nvgCPwgGX1EJSvf/SoYBPWNbcqxvLLcIxz/p2K7J6EI6EPJixonku1u+j+jikO/y
 ylKp6IlOFRcuvflDNmPp3V86g/zRa5WLyIdwsq0cXjZ5W5oN0RrIg==
X-ME-Sender: <xms:q8uCXhZ89m7wgrEPr1azLl5QZR58fjOjmz5kTXgFjNJew5ucRiRWkg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrudeiiedgkeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdludehmdenogevohgrshhtrg
 hlqdfhgeduvddqtddvucdludehtddmnecujfgurhephffvufffkffoggfgsedtkeertder
 tddtnecuhfhrohhmpeftuhhsshgvlhhlucevuhhrrhgvhicuoehruhhstghurhesrhhush
 hsvghllhdrtggtqeenucffohhmrghinhepohiilhgrsghsrdhorhhgnecukfhppeduvddu
 rdeghedrvdduvddrvdefleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
 grihhlfhhrohhmpehruhhstghurhesrhhushhsvghllhdrtggt
X-ME-Proxy: <xmx:q8uCXogqcm2Iv85hPvg9qfoyXQSuO4ca17wK4VvwCdZEuUi5vhOBZg>
 <xmx:q8uCXrZgZ9hIm-f06xH2JJul-hbkV1bEe4G4I8LudNzXm1FwC8Awqw>
 <xmx:q8uCXmNRdq16GQBtZxe_eFJvvu5eWLrNKo6ntuIpxmlCe5IV4DR4WA>
 <xmx:rcuCXreEe-rdDx-XBwx9KHd2PqAo0db0iIP-UPGVtAwqP-cKRz5ZWA>
Received: from crackle.ozlabs.ibm.com.com
 (ppp121-45-212-239.bras1.cbr2.internode.on.net [121.45.212.239])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3AC95306CAD2;
 Tue, 31 Mar 2020 00:48:41 -0400 (EDT)
From: Russell Currey <ruscur@russell.cc>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v7 0/7] set_memory() routines and STRICT_MODULE_RWX
Date: Tue, 31 Mar 2020 15:48:18 +1100
Message-Id: <20200331044825.591653-1-ruscur@russell.cc>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: ajd@linux.ibm.com, kernel-hardening@lists.openwall.com, npiggin@gmail.com,
 Russell Currey <ruscur@russell.cc>, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Addressing review comments from Daniel Axtens.

v6: https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=163335
v5: https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=160869

Changes since v6:
	[1/7] and [6/7]: Check for negative values of numpages and use
	      	  	 apply_to_existing_page_range() thanks to dja

Thanks for the feedback.

Christophe Leroy (2):
  powerpc/mm: implement set_memory_attr()
  powerpc/32: use set_memory_attr()

Russell Currey (5):
  powerpc/mm: Implement set_memory() routines
  powerpc/kprobes: Mark newly allocated probes as RO
  powerpc/mm/ptdump: debugfs handler for W+X checks at runtime
  powerpc: Set ARCH_HAS_STRICT_MODULE_RWX
  powerpc/configs: Enable STRICT_MODULE_RWX in skiroot_defconfig

 arch/powerpc/Kconfig                   |   2 +
 arch/powerpc/Kconfig.debug             |   6 +-
 arch/powerpc/configs/skiroot_defconfig |   1 +
 arch/powerpc/include/asm/set_memory.h  |  34 ++++++++
 arch/powerpc/kernel/kprobes.c          |  17 +++-
 arch/powerpc/mm/Makefile               |   2 +-
 arch/powerpc/mm/pageattr.c             | 114 +++++++++++++++++++++++++
 arch/powerpc/mm/pgtable_32.c           |  95 +++------------------
 arch/powerpc/mm/ptdump/ptdump.c        |  21 ++++-
 9 files changed, 199 insertions(+), 93 deletions(-)
 create mode 100644 arch/powerpc/include/asm/set_memory.h
 create mode 100644 arch/powerpc/mm/pageattr.c

-- 
2.26.0


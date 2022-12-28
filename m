Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 472266573B3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Dec 2022 08:38:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nhk0b0dH8z3c6n
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Dec 2022 18:38:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm3 header.b=GQcC6LqX;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=q4FIVeqB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=russell.cc (client-ip=64.147.123.21; helo=wout5-smtp.messagingengine.com; envelope-from=ruscur@russell.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm3 header.b=GQcC6LqX;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=q4FIVeqB;
	dkim-atps=neutral
X-Greylist: delayed 325 seconds by postgrey-1.36 at boromir; Wed, 28 Dec 2022 18:35:54 AEDT
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NhjxQ35W6z306n
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Dec 2022 18:35:53 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id CDE2C3200904;
	Wed, 28 Dec 2022 02:30:20 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Wed, 28 Dec 2022 02:30:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=cc
	:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm3; t=1672212620; x=1672299020; bh=kg/f9U9Ol4UD+1uc3IGmsV2dd
	QbQ6QRH+cPwJ6R0wEk=; b=GQcC6LqX9bOe7C6/VfGcwdWWCcYYpKAcVwi5Sl1Nq
	1eNL1f0lK5vgpC4d2a3aoXePQqOvivn1QRgzt5rEKKzol9gSVIfY0x5LFMmQWOBJ
	SHCFBMnHeRcrWDwtWRYSkeZ31F6tZc/5G4JQjIjx9kEaFHcviMd1AOhbUKsHJ9Fo
	5giFMOggshB8VZQdTTlNauoHokceLN8nkzMVbYn7R7ZtFKlryXepeNTSrOePwzPF
	idDy0w9V1E4jVANL3AAzylifu/svtWMi5Z0tqsZY2QR/BrS5bmaXDxNQhsyxxaew
	GXEsSrIJenlKS+1N6CR/xZMNCjRteYVzJOA4Ib+R/NgDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1672212620; x=1672299020; bh=kg/f9U9Ol4UD+1uc3IGmsV2ddQbQ6QRH+cP
	wJ6R0wEk=; b=q4FIVeqBvszFlxGwGJzkQvrKHGMqfSK3LjpxiTehFWF81Vzzfax
	ur86BYxhRyHMAnQ91pc3I7kwQIThGyTEZi9pjtJnDAT0nCpXNg0BEhOU+MWaI0a8
	LWb7F8tb6G8xOwJDTTDw8HM5A56ZnykhZQHDFAXuG+sZFfdYa/fp6TW66KgCy8dH
	N3FIr3KMOXuC7bnjCWskiy1kN14x8XizHalwMApvWRPgPFNX11ySWfQXQA5XrWON
	OJrEmCycM8QjxELYO8S15lY+InBl7xvWvyjp7tiNQDJp0Myaq4j7vouUGhz6xNd5
	tJKxrSaqFZ73czFcumbBu1WTn5z/6X30Z+A==
X-ME-Sender: <xms:i_CrY5D8PDmfB27uMNgFuYjdYIVVe1fTyUH3JzMNUxU8gDnA02zz2g>
    <xme:i_CrY3gFlyYF6UYZi-d2MbGQ19exMQDRtaid6HWyfOLSl0MbyyMKGPiQzm5sOm19p
    nVIZIZ-0-01au3hAw>
X-ME-Received: <xmr:i_CrY0l8Ny_IxehNDvYbUwoZ8Arek5CXbdc0tIRNvRh003D4dd4QLqCibIUIK41bLEgw7eyUW9bDP9v-HTmbpKYs0cE8WKTJw-HlMlJb1q5USg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedriedugdduuddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdludehmdenucfjughrpefhvf
    evufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeftuhhsshgvlhhlucevuhhrrhgv
    hicuoehruhhstghurhesrhhushhsvghllhdrtggtqeenucggtffrrghtthgvrhhnpeejte
    dvtdegvdeuveegudelgffgjeelteevteffieevjedvvefhueekkeelhfehleenucffohhm
    rghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprhhushgtuhhrsehruhhsshgvlhhlrdgttg
X-ME-Proxy: <xmx:i_CrYzzteBqcA9f6fTDxR5gAaxN9SuofXN5XKD5IL5piKJWimuuCAA>
    <xmx:i_CrY-SuNOI-JX-WQnTtaHVtZxLnNJyAU_ydcN_xXtgDxlBDcB6bHw>
    <xmx:i_CrY2brpRjwpRDxP8zn6OCKmHMJ2QvR8kcxW9-GXIZksgEkalze2Q>
    <xmx:jPCrY7TdLGfdpjzMSSW9vVW3Eb334ixQHBMi1NKnXtNbBd9NW_LW4Q>
Feedback-ID: i4421424f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 28 Dec 2022 02:30:16 -0500 (EST)
From: Russell Currey <ruscur@russell.cc>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 0/6] pseries dynamic secure boot interface using secvar
Date: Wed, 28 Dec 2022 18:29:37 +1100
Message-Id: <20221228072943.429266-1-ruscur@russell.cc>
X-Mailer: git-send-email 2.38.1
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
Cc: ajd@linux.ibm.com, gregkh@linuxfoundation.org, nayna@linux.ibm.com, linux-kernel@vger.kernel.org, zohar@linux.ibm.com, Russell Currey <ruscur@russell.cc>, gcwilson@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This series exposes an interface to userspace for reading and writing
secure variables contained within the PowerVM LPAR Platform KeyStore
(PLPKS) for the purpose of configuring dynamic secure boot.

This series builds on past work by Nayna Jain[0] in exposing PLPKS
variables to userspace.  Rather than being a generic interface for
interacting with the keystore, however, we use the existing powerpc
secvar infrastructure to only expose objects in the keystore used
for dynamic secure boot.  This has the benefit of leveraging an
existing interface and making the implementation relatively minimal.

This series needs to be applied on top of Andrew's recent bugfix
series[1].

There are a few relevant details to note about the implementation:

 * New additions to the secvar API, format() and max_size()
 * New optional sysfs directory "config/" for arbitrary ASCII variables
 * Some OPAL-specific code has been relocated from secvar-sysfs.c to
	powernv platform code.  Would appreciate any powernv testing!
 * Variable names are fixed and only those used for secure boot are
 	exposed.  This is not a generic PLPKS interface, but also
	doesn't preclude one being added in future.

With this series, both powernv and pseries platforms support dynamic
secure boot through the same interface.

[0]: https://lore.kernel.org/linuxppc-dev/20221106210744.603240-1-nayna@linux.ibm.com/
[1]: https://lore.kernel.org/linuxppc-dev/20221220071626.1426786-1-ajd@linux.ibm.com/

Russell Currey (6):
  powerpc/pseries: Log hcall return codes for PLPKS debug
  powerpc/secvar: WARN_ON_ONCE() if multiple secvar ops are set
  powerpc/secvar: Handle format string in the consumer
  powerpc/secvar: Handle max object size in the consumer
  powerpc/secvar: Extend sysfs to include config vars
  powerpc/pseries: Implement secvars for dynamic secure boot

 Documentation/ABI/testing/sysfs-secvar        |   8 +
 arch/powerpc/include/asm/secvar.h             |   5 +
 arch/powerpc/kernel/secvar-ops.c              |   4 +-
 arch/powerpc/kernel/secvar-sysfs.c            |  76 +++---
 arch/powerpc/platforms/powernv/opal-secvar.c  |  44 +++
 arch/powerpc/platforms/pseries/Kconfig        |  13 +
 arch/powerpc/platforms/pseries/Makefile       |   4 +-
 arch/powerpc/platforms/pseries/plpks-secvar.c | 250 ++++++++++++++++++
 arch/powerpc/platforms/pseries/plpks.c        |   2 +
 9 files changed, 365 insertions(+), 41 deletions(-)
 create mode 100644 arch/powerpc/platforms/pseries/plpks-secvar.c

-- 
2.38.1


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA1385550C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Feb 2024 22:42:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TZs9w16mVz3dWC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Feb 2024 08:42:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=etezian.org (client-ip=188.165.52.147; helo=8.mo560.mail-out.ovh.net; envelope-from=andi@etezian.org; receiver=lists.ozlabs.org)
Received: from 8.mo560.mail-out.ovh.net (8.mo560.mail-out.ovh.net [188.165.52.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TZs9R68swz3bmq
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Feb 2024 08:42:16 +1100 (AEDT)
Received: from director5.ghost.mail-out.ovh.net (unknown [10.109.176.103])
	by mo560.mail-out.ovh.net (Postfix) with ESMTP id 4TZs9H0Wytz1Fc7
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Feb 2024 21:42:10 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-62rx8 (unknown [10.108.54.171])
	by director5.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 58D4F1FD57;
	Wed, 14 Feb 2024 21:42:04 +0000 (UTC)
Received: from etezian.org ([37.59.142.103])
	by ghost-submission-6684bf9d7b-62rx8 with ESMTPSA
	id pzx8A6wzzWWJKwIAfHX53g
	(envelope-from <andi@etezian.org>); Wed, 14 Feb 2024 21:42:04 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-103G00581a402d0-df4d-43c0-80f3-f5461175c724,
                    C0FC2E5C6A7315DD97BDDE4B9606AB6EEADB6D9F) smtp.auth=andi@etezian.org
X-OVh-ClientIp: 89.217.109.169
From: Andi Shyti <andi.shyti@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
In-Reply-To: <20240212111933.963985-1-arnd@kernel.org>
References: <20240212111933.963985-1-arnd@kernel.org>
Subject: Re: [PATCH] i2c: pasemi: split driver into two separate modules
Message-Id: <170794692308.4040459.7350373390928340229.b4-ty@kernel.org>
Date: Wed, 14 Feb 2024 22:42:03 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
X-Ovh-Tracer-Id: 3725039842831960594
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvledrudejgdduheefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvegjfhfukfffgggtgffosehtjeertdertdejnecuhfhrohhmpeetnhguihcuufhhhihtihcuoegrnhguihdrshhhhihtiheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpeffteehudffvdfhudfgffdugfejjeduheehgeefgeeuhfeiuefghffgueffvdfgfeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeduvdejrddtrddtrddupdekledrvddujedruddtledrudeiledpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegrnhguihesvghtvgiiihgrnhdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugihpphgtqdguvghvsehlihhsthhsrdhoiihlrggsshdrohhrghdpoffvtefjohhsthepmhhoheeitddpmhhouggvpehsmhhtphhouhht
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
Cc: linux-arm-kernel@lists.infradead.org, Wolfram Sang <wsa@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Sven Peter <sven@svenpeter.dev>, Hector Martin <marcan@marcan.st>, linux-kernel@vger.kernel.org, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Olof Johansson <olof@lixom.net>, Nicholas Piggin <npiggin@gmail.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, asahi@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, Alyssa Rosenzweig <alyssa@rosenzweig.io>, linux-i2c@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi

On Mon, 12 Feb 2024 12:19:04 +0100, Arnd Bergmann wrote:
> On powerpc, it is possible to compile test both the new apple (arm) and
> old pasemi (powerpc) drivers for the i2c hardware at the same time,
> which leads to a warning about linking the same object file twice:
> 
> scripts/Makefile.build:244: drivers/i2c/busses/Makefile: i2c-pasemi-core.o is added to multiple modules: i2c-apple i2c-pasemi
> 
> Rework the driver to have an explicit helper module, letting Kbuild
> take care of whether this should be built-in or a loadable driver.
> 
> [...]

Applied to i2c/i2c-host-fixes on

git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git

Thank you,
Andi

Patches applied
===============
[1/1] i2c: pasemi: split driver into two separate modules
      commit: 3fab8a74c71a4ba32b2fa1dca7340f9107ff8dfc


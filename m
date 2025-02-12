Return-Path: <linuxppc-dev+bounces-6121-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DCFBA32663
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Feb 2025 13:58:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YtJJw3zd5z2ytT;
	Wed, 12 Feb 2025 23:58:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739365104;
	cv=none; b=b2+Gj7ogVpC1h+HBpE8J5MK4JRuM9MHCrCalF5sJm+nV/QEWguGNmu3pisJrWRP6A0oV7Zzt97j4s0KBBrjTByMa9ZmEB7XpXI3jLvtsX38OAv/yxrhJq+rCCTTXPHrpyrw5oY0p76Ti2ZqOIk23a6oNoK92odi6JLcvb9OKsILtGhICTy2DX652m6VY8l2BGgDBQIahHaLDoADQ85ALdCdSOMbwe7N1ShKWmbtIO4jjiiJ8J8kr3m9XmITgGCeuXFUdxsWfLVsXhMoCiUEVAPa/txG9K+M+hrVaifiOQTiYK5Xbmoz6k/DKcQoE75gulfDuNQot1xB6T+dxJgOmjw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739365104; c=relaxed/relaxed;
	bh=yyU0WWPEOvKR3G40BO2Fu6EDGNO7kZsKotfUj7HedY4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kzDTSzCu1qcZg5XcExXRpPuHfDgxkCUxgHKw6BG6xPGQLCI6csWi+/94og94YfzdA7tuQxfD0CaKYf47wce3XSh8CJRSOGOhbr6pwWtrCTomWMm0JFcOQnQTBbYioBm2kOqxNpfQhKw3vqtQTswJS8wGQX73tnZj/CNadWOBk4fUfZ7fZeDG8R2nZemQwZ931T+OkLu6VBEr+exWGSjPSW4fyPtbJkqc1On6QIGRCe3ZmKjNR0pIOEaehX1QslMk3c3Px4USTwl7i0Qb1mA9T87XSkMVBRvA/GsoPivwVBXFSUHHw3DvuWApFZgRsYfbZKLNpKbKbJMJwlokOFZiEw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aYoHh9I8; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=mchehab+huawei@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aYoHh9I8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=mchehab+huawei@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YtJJv27kvz2yRM
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Feb 2025 23:58:23 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 99EFAA40092;
	Wed, 12 Feb 2025 12:56:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC30EC4CEDF;
	Wed, 12 Feb 2025 12:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739365099;
	bh=+rUyy8CCsAX49LoyMo4QlyZTIfngKhPrGjoTwwC4T/4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=aYoHh9I8hOFC/rd6q6DuWBa0ELk6Z7OMZH+d1Po86Hca4RmKPfp6Iy748FXUdyIlI
	 tgH/3yl0mOAPAoIko670EqeX9y9i+3JZ/uI7ZsPHzcVNNFWCQ27UkVj53+bdt/O6h1
	 tp2zNyvG6uiP3W6uc1ax8M6WidyQaPTSueZo4zk6WWNhXIYT0nyl+heT4KgnulLxOT
	 VgWKUUVaGzBd9JgaNBnvjddPhhnrvtOVueKPNh9Ht9jYirxxZuEV9VqTmcHVbKcyW5
	 ewHSt4dDIHHeiLGHQBiKMVEehzQ+s32Auf+U/HtB+/DzK1kpDbUrePlehroB/oTObM
	 X96pQV4d2Rp4A==
Date: Wed, 12 Feb 2025 13:58:08 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>, Jonathan Corbet
 <corbet@lwn.net>, linux-kernel@vger.kernel.org, "David S. Miller"
 <davem@davemloft.net>, Andreas Noever <andreas.noever@gmail.com>, Avadhut
 Naik <avadhut.naik@amd.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Eric Dumazet <edumazet@google.com>, Hu Haowen
 <2023002089@link.tyut.edu.cn>, Lars-Peter Clausen <lars@metafoo.de>,
 Michael Jamet <michael.jamet@intel.com>, Mika Westerberg
 <mika.westerberg@linux.intel.com>, Paolo Abeni <pabeni@redhat.com>, Sean
 Young <sean@mess.org>, Yanteng Si <si.yanteng@linux.dev>, Yehezkel Bernat
 <YehezkelShB@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Michael
 Ellerman <mpe@ellerman.id.au>, Shrikanth Hegde <sshegde@linux.ibm.com>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Pawan Gupta
 <pawan.kumar.gupta@linux.intel.com>, James Morse <james.morse@arm.com>,
 "Nysal Jan K.A" <nysal@linux.ibm.com>, Tom Lendacky
 <thomas.lendacky@amd.com>, Sourabh Jain <sourabhjain@linux.ibm.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>, Frederic Barrat
 <fbarrat@linux.ibm.com>, Andrew Donnellan <ajd@linux.ibm.com>, Madhavan
 Srinivasan <maddy@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao
 <naveen@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-iio@vger.kernel.org, linux-media@vger.kernel.org,
 linux-usb@vger.kernel.org, netdev@vger.kernel.org,
 workflows@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 0/9] Extend automarkup support for ABI symbols
Message-ID: <20250212135808.58d2f032@foz.lan>
In-Reply-To: <Z6yFG_NntQfkwYli@archie.me>
References: <cover.1739254867.git.mchehab+huawei@kernel.org>
	<Z6yFG_NntQfkwYli@archie.me>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
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
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Em Wed, 12 Feb 2025 18:25:15 +0700
Bagas Sanjaya <bagasdotme@gmail.com> escreveu:

> On Tue, Feb 11, 2025 at 07:22:54AM +0100, Mauro Carvalho Chehab wrote:
> > Now that ABI creates a python dictionary, use automarkup to create cross
> > references for ABI symbols as well.   
> 
> I get three new warnings:
> 
> WARNING: /sys/devices/system/cpu/cpuX/topology/physical_package_id is defined 2 times: /home/bagas/repo/linux-kernel/Documentation/ABI/stable/sysfs-devices-system-cpu:27; /home/bagas/repo/linux-kernel/Documentation/ABI/testing/sysfs-devices-system-cpu:70
> WARNING: /sys/devices/system/cpu/cpuX/topology/ppin is defined 2 times: /home/bagas/repo/linux-kernel/Documentation/ABI/stable/sysfs-devices-system-cpu:89; /home/bagas/repo/linux-kernel/Documentation/ABI/testing/sysfs-devices-system-cpu:70

Those two are new reports that get_abi.py detects after the recent changes.
In the past, symbol duplication were detected only within the same group
(testing, stable, ...). The new version can detect symbols that are
duplicated on different parts of the ABI. In this specific case, the same
symbols exist on both stable and testing.

There is a fix for them already at:

https://lore.kernel.org/linux-doc/673e9543783349b0fcf625018e38e4e93fe98f52.1738020236.git.mchehab+huawei@kernel.org/

> WARNING: Documentation/ABI/testing/sysfs-class-cxl not found

I need to double-check verify this one, as it didn't appear on
my tests. Are you getting it against docs-next or linux-next?

Thanks,
Mauro


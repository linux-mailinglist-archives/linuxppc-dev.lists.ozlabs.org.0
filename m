Return-Path: <linuxppc-dev+bounces-3964-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D029EC27A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Dec 2024 03:50:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y7Kpw4RMYz30Sv;
	Wed, 11 Dec 2024 13:50:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733885448;
	cv=none; b=SOMn185a5YaAPEfhYb2BbliG69ixSFsgBcmDk9PmfqWLCnqsvOSIi0Wm5vzto+js7BuJ1fm4X8xuPKI67YK10vgP2Q3KACjNTOL2Ob9yEq28WJZTtHwSc2DgDnrj22i+d6LW4ZTAZBw4nAjRDo3hkMiGHKKdugZaqckjcGiZ43MuF1teipNMah+woQ8U+FC74G9iJiCSAIKHl1tBwfIPjjgk/cqLP9cFtPMuqaky7Hevh1qZx9Pyws8jDHICTJ22ZbGbzlMNR22w+Z2rRGJeij4i0UyTQTQYT1Acsjl1emSn9DkY/h89MKMB8weumkc1qqLrucjnn6IT/Ws67TomUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733885448; c=relaxed/relaxed;
	bh=N26vas4GEiufvz52cgMnt3IU547A62BqTHy/82WNU3w=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=KALGo92WdKSBOZ5G5crZP4XRElMjNTvmd2dRGcZtsc3l/kQw5m61BaLNLW9vnhh11aiNQnGX6J6pKLhDqMi3bj1QNq4P5TJpS7U5QRZUj8QtQxu7Isb/nq5iSr+L4rFMVtPE2Y5eiR9haGNc7F0dvkNTzHt7G9W2+Xk0wpeT14WPAXActCdPkLaEKs9MjcwNXzmbgjI4JfatQSP5L11L0WzK+vY1ErQmYiEjC0CcKPEELxYEoqOwuvBS+gHboq6uiqWFG/LhyOSQugbLwi+Wfi45a1NT/VGwSG0tEJjTeKJiT9ICbldUFtMoIWb6qaKkm1Ihm6kYRKTEEbObi8L92g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=u5fZ/gpW; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=u5fZ/gpW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux-foundation.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y7Kpv0Brlz30St
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Dec 2024 13:50:46 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8E954A41B57;
	Wed, 11 Dec 2024 02:48:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2F66C4CEDF;
	Wed, 11 Dec 2024 02:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1733885443;
	bh=C1p1Ur5QCo63c2pabe6pdtPHc4DXD/edWuUg2c5W1rI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=u5fZ/gpW5jFRGO7MUBQaaZ7EgRL5SbKSrvY7yk4XgnrXQ7iTXlQdgNQuxkXW8XsEU
	 DrSY2RvgO3myem+8+0r+fPnEVkJ622gxoAvBGZmHq1GHcjqcIgbi0UiHZMQHG1FvHq
	 abSWtb/hxC5Xk4n2V4Wr5FYMY7W0R77+cgVDL+GA=
Date: Tue, 10 Dec 2024 18:50:40 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Easwar Hariharan <eahariha@linux.microsoft.com>, Jeff Johnson
 <jeff.johnson@oss.qualcomm.com>, Pablo Neira Ayuso <pablo@netfilter.org>,
 Jozsef Kadlecsik <kadlec@netfilter.org>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Julia Lawall
 <Julia.Lawall@inria.fr>, Nicolas Palix <nicolas.palix@imag.fr>, Daniel Mack
 <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Robert
 Jarzmik <robert.jarzmik@free.fr>, Russell King <linux@armlinux.org.uk>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Ofir
 Bitton <obitton@habana.ai>, Oded Gabbay <ogabbay@kernel.org>, Lucas De
 Marchi <lucas.demarchi@intel.com>, Thomas =?ISO-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jeroen de Borst
 <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>,
 Shailend Chand <shailend@google.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 James Smart <james.smart@broadcom.com>, Dick Kennedy
 <dick.kennedy@broadcom.com>, "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>, "Martin K. Petersen"
 <martin.petersen@oracle.com>, Roger Pau =?ISO-8859-1?Q?Monn=E9?=
 <roger.pau@citrix.com>, Jens Axboe <axboe@kernel.dk>, Kalle Valo
 <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Jack Wang <jinpu.wang@cloud.ionos.com>, Marcel
 Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Florian Fainelli
 <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, Scott Branden
 <sbranden@broadcom.com>, Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Xiubo Li <xiubli@redhat.com>, Ilya
 Dryomov <idryomov@gmail.com>, Josh Poimboeuf <jpoimboe@kernel.org>, Jiri
 Kosina <jikos@kernel.org>, Miroslav Benes <mbenes@suse.cz>, Petr Mladek
 <pmladek@suse.com>, Joe Lawrence <joe.lawrence@redhat.com>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Louis Peens
 <louis.peens@corigine.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas
 Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, netfilter-devel@vger.kernel.org,
 coreteam@netfilter.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, cocci@inria.fr,
 linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-scsi@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
 ath11k@lists.infradead.org, linux-mm@kvack.org,
 linux-bluetooth@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-rpi-kernel@lists.infradead.org, ceph-devel@vger.kernel.org,
 live-patching@vger.kernel.org, linux-sound@vger.kernel.org,
 oss-drivers@corigine.com, linuxppc-dev@lists.ozlabs.org, Anna-Maria Behnsen
 <anna-maria@linutronix.de>
Subject: Re: [PATCH v3 00/19] Converge on using secs_to_jiffies()
Message-Id: <20241210185040.96c81a25f098f59191223c9f@linux-foundation.org>
In-Reply-To: <20241210184129.41aaf371@kernel.org>
References: <20241210-converge-secs-to-jiffies-v3-0-ddfefd7e9f2a@linux.microsoft.com>
	<315e9178-5b10-4de0-bdcf-7243e0e355bb@oss.qualcomm.com>
	<20241210153604.cf99699f264f12740ffce5c7@linux-foundation.org>
	<20241210173548.5d32efe0@kernel.org>
	<20241210183130.81111d05148c41278a299aad@linux-foundation.org>
	<20241210184129.41aaf371@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
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
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, 10 Dec 2024 18:41:29 -0800 Jakub Kicinski <kuba@kernel.org> wrote:

> On Tue, 10 Dec 2024 18:31:30 -0800 Andrew Morton wrote:
> > > > I'll just grab everything and see if anyone complains ;)  
> > > 
> > > I may, if this leads to a conflict :(  
> > 
> > Very unlikely, and any such conflict will be trivial.
> 
> Agreed, mainly I don't understand why we'd make an exception
> and take the patchset via a special tree.

It saves work for everyone?

The patches are super-simple.  If a maintainer chooses to merge one of
them, Stephen tells us and I drop the mm.git copy.  It's all so easy.



Return-Path: <linuxppc-dev+bounces-38-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CEF594FA1A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Aug 2024 01:01:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WjVQ85nPYz2yGZ;
	Tue, 13 Aug 2024 09:01:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=kolla.no
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kolla.no (client-ip=2a02:2c8:ea00:10::212; helo=melduny.fyrkat.no; envelope-from=linux-ppc@kolla.no; receiver=lists.ozlabs.org)
X-Greylist: delayed 417 seconds by postgrey-1.37 at boromir; Tue, 13 Aug 2024 08:39:46 AEST
Received: from melduny.fyrkat.no (melduny.fyrkat.no [IPv6:2a02:2c8:ea00:10::212])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WjTwf1zZcz2xZr
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Aug 2024 08:39:45 +1000 (AEST)
Received: by melduny.fyrkat.no (Postfix) with ESMTPSA id AFFB9793E;
	Mon, 12 Aug 2024 22:32:38 +0000 (UTC)
Date: Tue, 13 Aug 2024 00:32:37 +0200 (CEST)
From: =?UTF-8?Q?Kolbj=C3=B8rn_Barmen?= <linux-ppc@kolla.no>
To: linuxppc-dev@lists.ozlabs.org
cc: linux-kernel@vger.kernel.org
Subject: Since 6.10 - kernel oops/panics on G4 macmini due to change in
 drivers/ata/pata_macio.c
Message-ID: <62d248bb-e97a-25d2-bcf2-9160c518cae5@kolla.no>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII


Ever since 6.10, my macmini G4 behaved unstable when dealing with lots of
I/O activity, such as sync'ing of Gentoo portage tree, unpacking kernel
source tarball, building large software packages (or kernel) etc.

After a bit of testing, and patient kernel rebuilding (while crashing) I
found the cuplit to be this commit/change

https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/diff/?id=09fe2bfa6b83f865126ce3964744863f69a4a030


Exampe of what a opps/panic looks like (and they all look very much alike)

https://share.icloud.com/photos/042BHRkrXqPO-fllvpxMFl2CA


-- kolla


Return-Path: <linuxppc-dev+bounces-933-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 521EC96AA07
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2024 23:24:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WyzD20bKBz2yLJ;
	Wed,  4 Sep 2024 07:24:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=91.218.175.188
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725374762;
	cv=none; b=n7AN1eil3tI5tgT2UAuHmOvvNoTUiWmUm0AWRCrJiG2czn/vr3rRSj4RLWBiK0J/jbnqp7CmUWzdOz4hHBPmGjX6VoC8CMUrCw7PrT5B1yfMa1IEgh2Eu0q6VahvWrrhGlyysw6Q1K7UbuH0FhP2urK/DcrlmOkBnqXqp2do4XApl979uhtfGwCTguz1jLU5wj1ckpzdVQvbvp9bC/3OMmtcJE35eg1nwTrRED0+87s1XBLTIiGpAVMQovLGUjbLaoWqZG70lrybEb/56B8xYpcY+cuz3nRhmsOtQ06rlSt1n0e2SZSxlH2lmaNnpRfKnlrsa/eJZWM0QOefBBB3Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725374762; c=relaxed/relaxed;
	bh=UoipvRa1rIlz02HbMk6/9TovCElSsYtUx+SlrCp58mM=;
	h=DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=aXMx8PzDn81MPcomftrvcCME7uHHyoeTO/AiVKvnwmsV1aayD5lum7M0gZA6XS/xt4COE6HDyLatTKMvpaxLijnZfcpRIHbEHmwnE0Pgtv+Amr6GUa821Gg6IRa0WC5zzlPUalJgyOOsO26B3i6KojsF3sIVS+TujVugtNmY9Nvd5d+1JGeuLphjRL27MLErHMbrngS8WlwEdAGV8ua3wsLuhhGj8VnJAteR6Her36n+FY/X034qraBik19v7G4sDhn0LZp/Wt7x05NdJ60+ClMGsOgogrZuLRH+C0G+WOde8DB+y11Yi7t6I7X96lCLdUNAQTTDcW8JvmlhtQ7tug==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=qfQPriaM; dkim-atps=neutral; spf=pass (client-ip=91.218.175.188; helo=out-188.mta0.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=qfQPriaM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=91.218.175.188; helo=out-188.mta0.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org)
X-Greylist: delayed 342 seconds by postgrey-1.37 at boromir; Wed, 04 Sep 2024 00:45:59 AEST
Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WypMq36qlz2y3Z
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2024 00:45:59 +1000 (AEST)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1725374389;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UoipvRa1rIlz02HbMk6/9TovCElSsYtUx+SlrCp58mM=;
	b=qfQPriaMG7F97zrrYRPeqmNAzZ2Fya7Tx/pPdqSt1GFpgUddaebwTjEIgXnEVgMXx9UAtj
	rtPDaZ3L84KS7pDp3kSEy4UmxXJrOBaUpqQG+3GKMvtaQHOHJev9H/ASPyhRExHSXUPKri
	ElCIqPlGyfKU0+3NNWojOHfKeSuUQwM=
From: Andrew Jones <andrew.jones@linux.dev>
To: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org
Cc: pbonzini@redhat.com,
	thuth@redhat.com,
	lvivier@redhat.com,
	frankja@linux.ibm.com,
	imbrenda@linux.ibm.com,
	nrb@linux.ibm.com,
	atishp@rivosinc.com,
	cade.richard@berkeley.edu,
	jamestiotio@gmail.com
Subject: [kvm-unit-tests PATCH 0/2] configure: Support CONFIG_* extension
Date: Tue,  3 Sep 2024 16:39:47 +0200
Message-ID: <20240903143946.834864-4-andrew.jones@linux.dev>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

riscv already wants to change NR_CPUS sometimes, so a CONFIG_NR_CPUS,
which can be changed at compile time, would be helpful. We could just
provide support for that with the configure command line, but other
configurations will eventually come along (there are already two more
in another riscv branch). Add support for extending config.h with a
manually provided config.h-type file and also add support for using it
for CONFIG_NR_CPUS for riscv.

Andrew Jones (2):
  configure: Introduce add-config
  riscv: Make NR_CPUS configurable

 configure             | 17 ++++++++++++++++-
 lib/riscv/asm/setup.h |  3 ++-
 2 files changed, 18 insertions(+), 2 deletions(-)

-- 
2.46.0



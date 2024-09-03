Return-Path: <linuxppc-dev+bounces-908-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A4AA6969786
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2024 10:44:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WyfLh2y05z2xJy;
	Tue,  3 Sep 2024 18:44:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725353068;
	cv=none; b=SIEn8PFbLG8lCkKlUxknvNBVPI7RbFwp/YSD21sbtgiXkwpJn2ihnY16Fwxg7OUVZw6KqMoEQpI2wF8rCFPlGbbZi1/gV5EMgxqYtc7XpYHqMr9abV7XQf8qBqNgz79kWr8LVh+xYu9leYRLK6zKkW4lBHp3S4kb0S+GMQGbO5Ssada9U15BhordJFQUmevUdoPYbjd6T41AmfGIaFWiS22FqaSKcZZ8xMoeLKz/RtAE8t47nK8zHCIA9qrlFlZOY3q6djTE19fz0KmSIVtwnUFlYwdKEmR09CEEXHz/j4ba+ymiuEkd4NTvli+6n0EnjmuXQ0KnCqOIurePilT7+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725353068; c=relaxed/relaxed;
	bh=jvbHEin6/4UD0IVZdsGD3DqDHUjDC1ocCPKN1tXhdCU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IXlRD4vrWliB56lFV8LIAhaFnGKxqZZmgd5fyxWpwyvCcjjo2gMlg2s9poNK+eSzrZ1PKDGLl9jrD3+cgUiV2t0MErZUKwHS8b1RdS4ojXsWDb4ppkMacONL+zIw6TnSKnS7DkD6DFsg2qzjIWfL2+Go/WYJGDuKD3FeEir26cjiVQgraYANOe1gXDlv2bHL51GpAFVh+2erqHiMTi8ojl3tg8h5wu27TVR7G8sNFxQQ4bT66dHmj/8NpTqT89fN9R8HO8DwoOBnGs5a15YkdQjKsqs9tEIU4z0GQkUISvfmLLdxeXY5JZ1lnKH6j4KCH1Tv8nt/P5xmlHYJGNWMjw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WyfLg3Clgz2xBb
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Sep 2024 18:44:25 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4WyfLZ5NCCz9sSC;
	Tue,  3 Sep 2024 10:44:22 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ei9JIriNpoNU; Tue,  3 Sep 2024 10:44:22 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4WyfLZ4Xrtz9sS7;
	Tue,  3 Sep 2024 10:44:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 85BDC8B76E;
	Tue,  3 Sep 2024 10:44:22 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 7IFIJofcuulb; Tue,  3 Sep 2024 10:44:22 +0200 (CEST)
Received: from [172.25.230.108] (unknown [172.25.230.108])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 55B0E8B768;
	Tue,  3 Sep 2024 10:44:22 +0200 (CEST)
Message-ID: <7688f95f-3f08-404b-8c01-813ca5e23a3d@csgroup.eu>
Date: Tue, 3 Sep 2024 10:44:22 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/36] soc: fsl: Add support for QUICC Engine TSA and
 QMC
To: Herve Codina <herve.codina@bootlin.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Qiang Zhao <qiang.zhao@nxp.com>,
 Li Yang <leoyang.li@nxp.com>, Mark Brown <broonie@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20240808071132.149251-1-herve.codina@bootlin.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20240808071132.149251-1-herve.codina@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 08/08/2024 à 09:10, Herve Codina a écrit :
> Hi,
> 
> This series add support for the QUICC Engine (QE) version of TSA and QMC
> components.
> 
> CPM1 version is already supported and, as the QE version of those
> component are pretty similar to the CPM1 version, the series extend
> the already existing drivers to support for the QE version.
> 
> The TSA and QMC components are tightly coupled and so the series
> provides modifications on both components.
> Of course, this series can be split if it is needed. Let me know.
> 
> The series is composed of:
> - Patches 1 and 2: Fixes related to TRNSYNC in the QMC driver
> - Patches 3..6: Fixes of checkpatch detected issues in the TSA driver
> - Patch 7: The QE TSA device-tree binding
> - Patches 8..13: TSA driver preparations for adding support for QE
> - Patches 14 and 15: The support for QE in TSA + MAINTAINERS update
> - Patch 16: A TSA API improvement needed for the QE QMC driver
> - Patch 17: A clarification in the QE QMC driver
> - Patches 18..22: Fixes of checkpatch detected issues in the QMC driver
> - Patch 23: The QE QMC device-tree binding
> - Patches 24..31: QMC driver preparations for adding support for QE
> - Patches 32 and 33: Missing features additions in QE code
> - Patches 34..36: The QMC support for QE in QMC + MAINTAINERS update
> 
> Compared to the previous iteration, this v2 series updates device-tree
> bindings and fixes issues detected by kernel test robots.
> 
> Related to the QE QMC device-tree binding, I kept the unit address in
> decimal and the 3 compatible strings in order to avoid blocking the
> review waiting for a confirmation. Of course, this can be change in a
> next iteration.

Series applied for 6.12

Thanks
Christophe


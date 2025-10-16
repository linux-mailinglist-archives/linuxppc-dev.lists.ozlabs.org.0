Return-Path: <linuxppc-dev+bounces-12940-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D61EBBE1F21
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Oct 2025 09:36:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cnKXM3vgYz30Vl;
	Thu, 16 Oct 2025 18:36:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=85.215.255.53 arc.chain=strato.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760600211;
	cv=pass; b=FhWkHUIaUHWZA0yJsfscjgwbobVziS2oBgEh3J+6JaJLO5Nl5K51c8JK+iZ7u4/GR+R8bTrpqYLzKnHDUg7theY56kZCJAbgq9dHQMaE2r2Psx9FScfvM949RbYFWV6LgBS0x9fB/H0ZEC6Wz68LBDGFA+hXeCkgYLEzJTZaEjlgfl+m4ekWDR6PFHVRgLMIM3UXKnj+568d5VSf5Jd7xRsaJq2GIdjT+7v5OIcN0s1o1MW5XjDXsjA7KOsEBzrRf01R1neiDszhpC6NnvKy8cHfLfqp0vez6v7G1jw3anCRtHA8R7DCYla+jT56jDqzoAGMIEeWfZ4JDSTvYTrWuQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760600211; c=relaxed/relaxed;
	bh=omfRFwFuup0ZF5Z4dN/shtcrXqUiRc+J4Lic1C/QBrM=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Cc:Date:
	 Message-Id:References:To; b=ZV38KKnQXb3VukBU8LApMga68euQwm3S3iIDViTe8fdhyxtFnobR3d+BMdMymBWfKGywJEUwqwwy9atWPBrgCSGS+pVNt3QdnA6QNWQeHJjPv5MGkHY7iETmvclfDdVjFg4ccA5RUql6tFRLOmPW3L3fxUWH8q7vytS7eSNc7QJIVJYcXEMyAp+8hFvIHwBYskUWCQFo1Zi/WMf3eDQk+Ho1SMyRLFH/F54SFJqBSUF9L8Ss7K7P7QbL2lf9YEdJlj1aPSTVZTXgQNW6bKMcpfjZynW5hhplT7s9Wtvl1GNdc7+y12SCfzGBdDyaU8F4HGoBe0cJdrPlFDFpnJp4mw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de; dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=MS0eFW4D; dkim-atps=neutral; spf=pass (client-ip=85.215.255.53; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org) smtp.helo=mo4-p01-ob.smtp.rzone.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=MS0eFW4D;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.53; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cnKXJ6fYgz2yqq
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Oct 2025 18:36:47 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1760600201; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=XoPg3LmvH1Y2JnBFy5C/1RMg2tcpV8KZ7I+e2kTkbuttioh5aJMHrVXJquyxPjnklv
    jVUeggTjtc6naKywTDJEoza0Z6dVX0gZf+nPXrJgvhkrSL08/n20YkHgClkpIPCZzCvb
    yHCj2Y5G3ICUPBPMpj95mMsdogYb4YuAJlFbIuXrFqtCeo21EKBWqJkLluiv/gMIx/Fx
    scZ4a/IyYtbLFL6m005IWZYu9JWBkydw5CcrylMbQs6f9vtIJ9JqhZC2qX7ZT2wPmjOI
    WfRCIJL9HTuCBSbH6fY/MTC/v3dpS+bQyLXAM0qPvAajYnjeQCyU4emY+FQA6pam+4uW
    HXKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1760600201;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Date:Cc:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=omfRFwFuup0ZF5Z4dN/shtcrXqUiRc+J4Lic1C/QBrM=;
    b=cSruyN/cC1tqCk8WLhay9JvQsh2y/KNP161dyn5cVjqF78awys7vJWGHaIalTued3H
    cw2vRcWElsa72P/30dqurKcbTKY7jDVuU2qOqRpw9QTCNKLG4MNC9kZCV9CxIQRW8C7X
    kxodUDY0E6TAjDcOO6FhAXd6b+693wweOMT0sEfXW+oaD/nVh0GIsqQffRHtyvnWqRE5
    Ml3m+7F5ucgjOrsxNyPf2r/JGyNEGj4dxnMO7cmizP8p1tjlTbNArlkKrxgtvTjQV5JO
    fhSKe/fAbFQrmEdhjC/JatGu2yHmYQ3V6bISwWSVAsjLea3gUTZXJyMBKggzRIJ5DNlS
    hsDQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1760600201;
    s=strato-dkim-0002; d=xenosoft.de;
    h=To:References:Message-Id:Date:Cc:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=omfRFwFuup0ZF5Z4dN/shtcrXqUiRc+J4Lic1C/QBrM=;
    b=MS0eFW4D1F6Mf96PUwVqFbTvG80yMY2N7jKVm0LiHPo+og31thnBjJn1J1IA+aLLaL
    QOarNgb1wlOUlY/noxONmeAXASxlswJliW3HUF66JKahHmvkbwebd6KZ89DWFau8bp9A
    fUWgLdQ7mMW5EWkM17CrLRGjsVq6uECg3uYZqLzG6Dhv3RzUSLfOXxT+HmpNHguRDa5d
    Nd9P/8oQTZ59YQg19x8L+0Ab4YqfQ/aqx/QH2gEr/vwJymD8XdN1zC39o5cCau79dRxT
    TLmSy2RbSB2+LDkmt/Ddwns3ip+13034xE8i1CCL61iYcZWE32+z8OGaO2mMBxgZ4Caz
    dpEg==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6KxrfO5Oh7V7X5iys3LBXHQhT9oAbY5gi9kPmpZaJCQDfE3RBQ0="
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 53.4.2 AUTH)
    with ESMTPSA id e2886619G7aeaKW
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Thu, 16 Oct 2025 09:36:40 +0200 (CEST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Mime-Version: 1.0 (1.0)
Subject: Re: [PPC] Boot problems after the pci-v6.18-changes
From: Christian Zigotzky <chzigotzky@xenosoft.de>
In-Reply-To: <A1E3F83C-3AE8-43B7-9DCB-6C38C94F8953@xenosoft.de>
Cc: Lukas Wunner <lukas@wunner.de>,
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
 =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 mad skateman <madskateman@gmail.com>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 Christian Zigotzky <info@xenosoft.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, hypexed@yahoo.com.au,
 Darren Stevens <darren@stevens-zone.net>, debian-powerpc@lists.debian.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Herve Codina <herve.codina@bootlin.com>
Date: Thu, 16 Oct 2025 09:36:29 +0200
Message-Id: <48F07B75-2DF3-4E9A-BC22-ADF1ED96DB06@xenosoft.de>
References: <A1E3F83C-3AE8-43B7-9DCB-6C38C94F8953@xenosoft.de>
To: Bjorn Helgaas <helgaas@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, linux-pci@vger.kernel.org
X-Mailer: iPhone Mail (23A355)
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Is it possible to create an option in the kernel config that enables or disa=
bles the power management for PCI and PCI Express?
If yes, then I don=E2=80=99t need to revert the changes due to boot issues a=
nd less performance.=



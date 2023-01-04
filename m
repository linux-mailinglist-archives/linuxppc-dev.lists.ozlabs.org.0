Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF9565CC3C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Jan 2023 04:47:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NmwY31Dc4z3cBP
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Jan 2023 14:47:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm3 header.b=Na1lG4DR;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=pqjKnzwj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=russell.cc (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com; envelope-from=ruscur@russell.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm3 header.b=Na1lG4DR;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=pqjKnzwj;
	dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NmwWj0kxmz3c6P
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Jan 2023 14:46:41 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 2E3085C00D5;
	Tue,  3 Jan 2023 22:46:39 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Tue, 03 Jan 2023 22:46:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1672803999; x=
	1672890399; bh=gFFDVFxDhdh78/CM4G8bL0eEgbbPLaakK8kfr6x0JhE=; b=N
	a1lG4DR86EmLpQcrnMJnJqJji9JaMIdpDuywtCJA18f1RTTK9LO16DzXOs3/cne4
	VpVrsOct8fX4vktFubf1f9u065v3ByjgvA3SllldmBW7jq8ZoMfFNjm17mKSTnES
	11hKLKF013WFT/LMZepYO/xpzO7WruRNu0Wo6H44Iic1G3IbnZ92H93P7n0yQQh/
	Zup5aj4jveGSARziTfMqPZFs1aeGgn5lgT07gTPoyUknMIlTTirQiT9L4ZyPDmj0
	DanIrPm2HYfKlLKz/bJ73CHlgiIGy1MYjO/aw7tliwT3EyFPm+7lim2O/4N3r8dM
	mHvZLh6jJcLq2EgOzcerA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1672803999; x=
	1672890399; bh=gFFDVFxDhdh78/CM4G8bL0eEgbbPLaakK8kfr6x0JhE=; b=p
	qjKnzwjD26l/tPMOffdoelalhSmEtGSOT6U8psk0KIXHDIPKol1agMyfc/iSyVcB
	bc6ikoJo9tN0KRTzNyx62A41G1yJVr1ruNaDjvZ7RZeonLCbfTnqFARlbYk4DTSU
	tGN1PVdEpYJFbknrNyCeyblzy4C/TtYHi8xeZ0c+wLwzOKpC77FRs5iCz7GTaw1Q
	Icmx99kC6aKd7G8oQnfVWGztKTAhwmuVBsSV8D9vlXnnsHJ985Q4TTyX2mIyd+Qn
	IHDebdh1D8E/GRkK3T0D82DQoo9wQTKin4052aCVA5o4kwuKfE8UcqVC9yNmwb/x
	u7zG3xb9t6h20+AiOQYdg==
X-ME-Sender: <xms:nva0Y8BVuxib0HIS7fDKuv-AsUoQxUW122YUMeQ0txKC7Y61J7wxAw>
    <xme:nva0Y-gexKvnDT6d550iaXi1X7Ns0_Nb2N6vIRTrVmB-GRQoWiSRHgTs5p6WbWmgJ
    Vj54Sydub8MmKUUjg>
X-ME-Received: <xmr:nva0Y_nwhfs5ZbdOb8XQIG4amABJTMtJCAYfnry7F-S8xdGMterl_oC41f5NpclJl7Ulh3-KJLvyUCRGcvYI6fBzVSKEOHlGdlvis_zfMJIFJQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrjeehgdeihecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecufghrlhcuvffnffculdduhedmnecujfgurhepkffuhf
    fvveffjghftgfgfgggsehtqhertddtreejnecuhfhrohhmpeftuhhsshgvlhhlucevuhhr
    rhgvhicuoehruhhstghurhesrhhushhsvghllhdrtggtqeenucggtffrrghtthgvrhhnpe
    etgfeilefhueefvedvkeehieefjefgfeegheetudekiefguddutdeukeetveelleenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehruhhstghurh
    esrhhushhsvghllhdrtggt
X-ME-Proxy: <xmx:n_a0Yyy89sb4WHQDesTN1MbvY0UMBSLFlxcqa8v44mHCSBgB6cEfXA>
    <xmx:n_a0YxRr8UBqaUOPIUGROFW_Vm2yoz2Is-TPWtK_qi9kXHBuSg4ELQ>
    <xmx:n_a0Y9YrVRxEWn8eDxTr6jnbrrB92gjQAhbQl0Qi7Q6hiT_4qTNPuw>
    <xmx:n_a0YwGrqUShFhqaSHPY1tIywBUl4k664iOURGyKuyt_XYmfcc6fOw>
Feedback-ID: i4421424f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 Jan 2023 22:46:36 -0500 (EST)
Message-ID: <4739e474a2e8d6339f0f37b1bfa6bc1fd71d81d3.camel@russell.cc>
Subject: Re: [PATCH 2/4] powerpc/pseries: Fix alignment of PLPKS structures
 and buffers
From: Russell Currey <ruscur@russell.cc>
To: Andrew Donnellan <ajd@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Date: Wed, 04 Jan 2023 14:46:34 +1100
In-Reply-To: <20221220071626.1426786-3-ajd@linux.ibm.com>
References: <20221220071626.1426786-1-ajd@linux.ibm.com>
	 <20221220071626.1426786-3-ajd@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.2 (3.46.2-1.fc37) 
MIME-Version: 1.0
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
Cc: nayna@linux.ibm.com, gjoyce@linux.ibm.com, bgray@linux.ibm.com, brking@linux.ibm.com, gcwilson@linux.ibm.com, stefanb@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2022-12-20 at 18:16 +1100, Andrew Donnellan wrote:
> A number of structures and buffers passed to PKS hcalls have
> alignment
> requirements, which could on occasion cause problems:
>=20
> - Authorisation structures must be 16-byte aligned and must not cross
> a
> =C2=A0 page boundary
>=20
> - Label structures must not cross page coundaries
>=20
> - Password output buffers must not cross page boundaries
>=20
> Round up the allocations of these structures/buffers to the next
> power of
> 2 to make sure this happens.
>=20
> Reported-by: Benjamin Gray <bgray@linux.ibm.com>
> Fixes: 2454a7af0f2a ("powerpc/pseries: define driver for Platform
> KeyStore")
> Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
>=20
Reviewed-by: Russell Currey <ruscur@russell.cc>


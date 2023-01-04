Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E3C65CC3B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Jan 2023 04:46:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NmwX13l2nz3c83
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Jan 2023 14:46:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm3 header.b=A1qXY62t;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=YoP6/R1i;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=russell.cc (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com; envelope-from=ruscur@russell.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm3 header.b=A1qXY62t;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=YoP6/R1i;
	dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NmwVv5h3gz2xH9
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Jan 2023 14:45:58 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id AD19F5C011A;
	Tue,  3 Jan 2023 22:45:54 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Tue, 03 Jan 2023 22:45:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1672803954; x=
	1672890354; bh=FK0GQjHoneNJQH44B4MVIKNtyLKlTNU+ijuB/TqrZqo=; b=A
	1qXY62tLsm4K73NPbX9VbNYgEHuRBbIaalVX0t8kPI42Q8wplTpwnQ46ZXKMgVvG
	IOpuF2UXq252viBEG/C7xxRnizprghdiOhuzpUh5W2TD+Vn8dWXV2MoE7h+lfAfm
	Rf2v73kDyPDE5bkmIn/X6nrW/yfvKebt2wtvtJWGh0BvYcJLPO9R19skUPGJdGAn
	3fEiVm5UP1SAdiPc+53fSzhJY6+/lDSaN1jZapWvLZxHTMRFO7YMq+0DNT4uyz2w
	ZquF+66lY6duiJN6IeCJnywwlXV0HzlyJm58IVmIla8g82Xm06Ot1g+Imml4bV5L
	yhSA7KIILMojaTZ61Qblg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1672803954; x=
	1672890354; bh=FK0GQjHoneNJQH44B4MVIKNtyLKlTNU+ijuB/TqrZqo=; b=Y
	oP6/R1i0p9IuvJq58eoCIVCDijC5MPficoHERasJTlCGc52pGljuo0+qtE31OA4d
	JDCChnboQACDsfW9+Fech2n3mjg14orPyhOKEXLkXFVWhkBwKVRqh/L9MjtEuNUX
	TMU9GTCxFNO31aHqOf8isp0kE2QWpDM63VErE6u5bVPhwBzFlN2buTpfhfEWKXkG
	rkUhdQGOYwTK6nIlt5mlrj+mYtwhVCDgKcEIXba9XLy/2+N7bra81MYawUcuA8QF
	HNCpRCqDhtHTmngB75tHTFOmZiQ/OOXKTaCMPZxyXQJekDw55Izced6bOMP6sMaY
	098zjXEpsCIK5KHaQGV0A==
X-ME-Sender: <xms:cva0Y9ddssmwG3LB6x5bl6qoFs0kZnWqlEmqEfh8mP5mt_8Xps1t5A>
    <xme:cva0Y7M6a12OlgN7TlXJBBF6mL8Rv4lNcHOeco17TEBvhWlQZtb0DkECV3wjBy6Rz
    WZ8M7bu2qPsxIBeyg>
X-ME-Received: <xmr:cva0Y2goyWtgCsC0yDGvzO2wQkPwuusNppkbwBnii4DryHDyzoWjy4362_KJKEN7FhkvTQ0saxLUDU5qdOiLyHY26ZRj0V8LjCGwOU_IIVLqEQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrjeehgdeihecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecufghrlhcuvffnffculdduhedmnecujfgurhepkffuhf
    fvveffjghftgfgfgggsehtqhertddtreejnecuhfhrohhmpeftuhhsshgvlhhlucevuhhr
    rhgvhicuoehruhhstghurhesrhhushhsvghllhdrtggtqeenucggtffrrghtthgvrhhnpe
    etgfeilefhueefvedvkeehieefjefgfeegheetudekiefguddutdeukeetveelleenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehruhhstghurh
    esrhhushhsvghllhdrtggt
X-ME-Proxy: <xmx:cva0Y28Qt1P6cSEYePFoNL1ganqVVxvdDKy6twC59SMiyJ0q4FgVQw>
    <xmx:cva0Y5t9TcLjyW6Uy4t8nj-qkJ1XuP4CtinfYfNBR_eqiJust6s6Mg>
    <xmx:cva0Y1FZog8u9MEA_53LcfxPS7uA1rLN74wY1MqqhaBz3Tb-Ps20bA>
    <xmx:cva0Y9jm3mvfOO_q6abT6pwqCeKGr36HAeSYk6AJepVMdLGDoMx0WA>
Feedback-ID: i4421424f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 Jan 2023 22:45:51 -0500 (EST)
Message-ID: <7b29718b8576e272fdb84054a11c007c24ab5ca2.camel@russell.cc>
Subject: Re: [PATCH 1/4] powerpc/pseries: Fix handling of PLPKS object
 flushing timeout
From: Russell Currey <ruscur@russell.cc>
To: Andrew Donnellan <ajd@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Date: Wed, 04 Jan 2023 14:45:47 +1100
In-Reply-To: <20221220071626.1426786-2-ajd@linux.ibm.com>
References: <20221220071626.1426786-1-ajd@linux.ibm.com>
	 <20221220071626.1426786-2-ajd@linux.ibm.com>
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
> plpks_confirm_object_flushed() uses the H_PKS_CONFIRM_OBJECT_FLUSHED
> hcall
> to check whether changes to an object in the Platform KeyStore have
> been
> flushed to non-volatile storage.
>=20
> The hcall returns two output values, the return code and the flush
> status.
> plpks_confirm_object_flushed() polls the hcall until either the flush
> status has updated, the return code is an error, or a timeout has
> been
> exceeded.
>=20
> While we're still polling, the hcall is returning H_SUCCESS (0) as
> the
> return code. In the timeout case, this means that upon exiting the
> polling
> loop, rc is 0, and therefore 0 is returned to the user.
>=20
> Handle the timeout case separately and return ETIMEDOUT if triggered.
>=20
> Fixes: 2454a7af0f2a ("powerpc/pseries: define driver for Platform
> KeyStore")
> Reported-by: Benjamin Gray <bgray@linux.ibm.com>
> Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>

Tested-by: Russell Currey <ruscur@russell.cc>
Reviewed-by: Russell Currey <ruscur@russell.cc>


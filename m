Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EDF13CF7DD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jul 2021 12:28:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GTZgS1x1Wz3bg7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jul 2021 20:28:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=rrc4HUbr;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=jR9gOGNe;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=193.142.43.55;
 helo=galois.linutronix.de; envelope-from=tglx@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=rrc4HUbr; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=jR9gOGNe; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GTZg10W5Hz309r
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jul 2021 20:28:13 +1000 (AEST)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1626776885;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bDwlcccV3/vrCei0Ik2QF0oAbhCHCeGSps/lbR/oXjs=;
 b=rrc4HUbrItu4keiCBFDV6/iZsLiL8usY9FbDHeI4D0I1/zy+CkNxG1g/5XN9JnUxDBX1XH
 D8nz4ERDGHLbOEIT6E/f4yGW2VHnGFKo1WLQJIxyye2fbdZwZ8qSxtslrqM9QYKkj2ffZs
 seq8Kab8uW4nWTm68L+sBOS0XdBrAuCI4uidnM8U84SNow92p0TxRnF1HSbzt3SvPAQDpr
 T2RSz05IuSv9YmY1RGtRFynXZoGZkvntuXukmueiIJlwSFCEcq4MXiMIgfckew/n+lUT62
 U33GBTeu0r4pJrD81lbua3jk0eve0oivLfdISVdOx5NP2n2Rhv/7CcYMsHYC6A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1626776885;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bDwlcccV3/vrCei0Ik2QF0oAbhCHCeGSps/lbR/oXjs=;
 b=jR9gOGNeHOnpLDQqTwtWhDmu3e6WgD3WgKRfTXr62rFosvzmq87Ej2fos213iV2PD7DabD
 8U9PI7FVSnWR/iBg==
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc: use IRQF_NO_DEBUG for IPIs
In-Reply-To: <20210719130614.195886-1-clg@kaod.org>
References: <20210719130614.195886-1-clg@kaod.org>
Date: Tue, 20 Jul 2021 12:28:05 +0200
Message-ID: <87czrde0ui.ffs@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 19 2021 at 15:06, C=C3=A9dric Le Goater wrote:
> There is no need to use the lockup detector ("noirqdebug") for IPIs.
> The ipistorm benchmark measures a ~10% improvement on high systems
> when this flag is set.
>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Thomas Gleixner <tglx@linutronix.de>

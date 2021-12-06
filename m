Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F33C469F92
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Dec 2021 16:49:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J77CG1yQTz2ynG
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Dec 2021 02:49:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=srs.iliad.fr (client-ip=212.27.33.1; helo=ns.iliad.fr;
 envelope-from=srs0=63cgvt=qx=freebox.fr=mbizon@srs.iliad.fr;
 receiver=<UNKNOWN>)
Received: from ns.iliad.fr (ns.iliad.fr [212.27.33.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J77Bl4Mf7z2xrr
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Dec 2021 02:48:44 +1100 (AEDT)
Received: from ns.iliad.fr (localhost [127.0.0.1])
 by ns.iliad.fr (Postfix) with ESMTP id C35462007F;
 Mon,  6 Dec 2021 16:48:39 +0100 (CET)
Received: from sakura (freebox.vlq16.iliad.fr [213.36.7.13])
 by ns.iliad.fr (Postfix) with ESMTP id AB9D71FF80;
 Mon,  6 Dec 2021 16:48:39 +0100 (CET)
Message-ID: <69b0ffeb98a641c74f3beccf9dfc752bef96c51b.camel@freebox.fr>
Subject: Re: Fail to boot 5.15 on mpc8347 with either debug_pagealloc or nobats
From: Maxime Bizon <mbizon@freebox.fr>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Date: Mon, 06 Dec 2021 16:48:39 +0100
In-Reply-To: <06827bee-8f58-daae-3098-64cb08e090de@csgroup.eu>
References: <f23763d551e65d4a225ba13c7898f83853c2aeaf.camel@freebox.fr>
 <68bf4c39-53ce-f88f-383f-5defb1a36b1c@csgroup.eu>
 <913068d2c368c80f89d6f9575d6b41e6fab48ae2.camel@freebox.fr>
 <c7b4ef55-1deb-41f6-58cc-f8dc4477e90c@csgroup.eu>
 <20211204141031.GA23757@sakura>
 <5f4d36a1-695d-38a7-9ff9-d5af97f1a7e0@csgroup.eu>
 <20211205164217.GA29658@sakura>
 <d39825e0-6b48-5ac1-662e-26186e730eaa@csgroup.eu>
 <20211205214408.GC29658@sakura>
 <cea77e1e-9972-33cf-3ef8-e0be5ff26b63@csgroup.eu>
 <b39cea045b4317a83b4605f2aeb8a88bcc44b1d7.camel@freebox.fr>
 <854e7a5f-2b1b-47de-51fb-6cd0f3c6ccd3@csgroup.eu>
 <b9a4afdc13d29100d562232b6376834782c02e92.camel@freebox.fr>
 <06827bee-8f58-daae-3098-64cb08e090de@csgroup.eu>
Organization: Freebox
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ;
 Mon Dec  6 16:48:39 2021 +0100 (CET)
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
Reply-To: mbizon@freebox.fr
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On Mon, 2021-12-06 at 14:22 +0000, Christophe Leroy wrote:

> Fixed both in v2.

Works fine, many thanks 

-- 
Maxime




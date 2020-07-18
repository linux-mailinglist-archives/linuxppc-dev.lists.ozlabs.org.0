Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F348224ACA
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Jul 2020 12:53:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B84bK2XSczDrQM
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Jul 2020 20:53:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=hadess.net (client-ip=217.70.178.242; helo=mslow2.mail.gandi.net;
 envelope-from=hadess@hadess.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=hadess.net
Received: from mslow2.mail.gandi.net (mslow2.mail.gandi.net [217.70.178.242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B84Yl1yjdzDqWX
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Jul 2020 20:51:54 +1000 (AEST)
Received: from relay5-d.mail.gandi.net (unknown [217.70.183.197])
 by mslow2.mail.gandi.net (Postfix) with ESMTP id 7B62D3A1BE3
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Jul 2020 10:39:15 +0000 (UTC)
X-Originating-IP: 82.255.60.242
Received: from classic (lns-bzn-39-82-255-60-242.adsl.proxad.net
 [82.255.60.242]) (Authenticated sender: hadess@hadess.net)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id DF9991C0002;
 Sat, 18 Jul 2020 10:38:36 +0000 (UTC)
Message-ID: <c1ce6d1eaeed9e239742c12f4f82c84ad3f36fd4.camel@hadess.net>
Subject: Re: [PATCH] HID: udraw-ps3: Replace HTTP links with HTTPS ones
From: Bastien Nocera <hadess@hadess.net>
To: "Alexander A. Klimov" <grandmaster@al2klimov.de>, jikos@kernel.org, 
 benjamin.tissoires@redhat.com, mpe@ellerman.id.au,
 benh@kernel.crashing.org,  paulus@samba.org, linux-input@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org,  linux-kernel@vger.kernel.org
Date: Sat, 18 Jul 2020 12:38:35 +0200
In-Reply-To: <20200718103344.3407-1-grandmaster@al2klimov.de>
References: <20200718103344.3407-1-grandmaster@al2klimov.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 2020-07-18 at 12:33 +0200, Alexander A. Klimov wrote:
> Rationale:
> Reduces attack surface on kernel devs opening the links for MITM
> as HTTPS traffic is much harder to manipulate.
> 
> Deterministic algorithm:
> For each file:
>   If not .svg:
>     For each line:
>       If doesn't contain `\bxmlns\b`:
>         For each link, `\bhttp://[^# \t\r\n]*(?:\w|/)`:
> 	  If neither `\bgnu\.org/license`, nor `\bmozilla\.org/MPL\b`:
>             If both the HTTP and HTTPS versions
>             return 200 OK and serve the same content:
>               Replace HTTP with HTTPS.
> 
> Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>

Looks good!

Acked-by: Bastien Nocera <hadess@hadess.net>


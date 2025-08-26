Return-Path: <linuxppc-dev+bounces-11320-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DE006B35E01
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Aug 2025 13:50:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cB5Zm61zcz3dSR;
	Tue, 26 Aug 2025 21:50:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756209040;
	cv=none; b=ZRyejwv6ff2gRX7Sec5AYUoSrVa4s1LoPdf4iCtWpCLm2xNI7qO1P/9dx6MZjVKax5RCotEeGQ9jTIx8w6lQ5/ziySLFr/SU9YawQ5Df/qrbALGHxHqEv/KlmV4u/Jgbhk6tBxtMTWp6MBHxQ8iHfZSRxD9n1n/2Tovj+ZZi+vBxjT3OIcteyn1k4X9JnaXR5efONUpavR7yjMx8pwsoaWZXI6dIfDsQscp/qf457qJPQXh3iI900ugzSUFiBtOLmlxO9B6hlgX0kQwEi40eqtgs7CSJ9ua6IQ205b3eDUIIUYlrRQPo5pEq87zueDaTiUG8YU3hbeFEHKe5f5opVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756209040; c=relaxed/relaxed;
	bh=WhHPZ19/cEM7iqonGs8G7Mgn3LlE53oubopyYFkWhKs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dj5Q6VYN6C7NrPeBtsTW9Gx9+4lp66nKrZVA184vMwC9Alo3NXGTX9RBAkVIMgh0hHCOnjnVvnsNxYOo8ZD4k+QsZTJBcEID0s723UWsrXHxsuAShHKeTeNNuvvdX6V5fxQH8HXRCQdpltZLHkF+tWsIEsKxmXDzpekZX6pclXVAn2LW3SDmtB3x+cVhGAJpme1UudkZqU1WOODQzVrmeaXDi4p5lZKBKd2N9bXFGzbPn88p2y/jJr3jeCMgULhKbPqbHeRo5uloE7Wzm/nlRQbhctp0qEOxWAjzV1ZoA9j6SgpJeWPjZTKXWPAo2sjOETqUIOV06Ec99tMt66i+jA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cB5Zh4r3lz3dRW
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Aug 2025 21:50:35 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cB3LZ3MDjz9sSg;
	Tue, 26 Aug 2025 12:09:58 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CY5rl8dKhYd7; Tue, 26 Aug 2025 12:09:58 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cB3LZ2B35z9sSX;
	Tue, 26 Aug 2025 12:09:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 007558B764;
	Tue, 26 Aug 2025 12:09:58 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id tuoxyMldcTmb; Tue, 26 Aug 2025 12:09:57 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id B600F8B763;
	Tue, 26 Aug 2025 12:09:57 +0200 (CEST)
Message-ID: <2a1aa3c7-d741-4044-9d0d-d6e1e0c3f9a2@csgroup.eu>
Date: Tue, 26 Aug 2025 12:09:57 +0200
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
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Ozlabs patchwork notification not working anymore
To: Jeremy Kerr <jk@ozlabs.org>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com
References: <8f6e5825-9468-4499-9bbd-4588a1eccc94@cs-soprasteria.com>
 <20250729183222.15adbb95@canb.auug.org.au>
 <cd2ee23092e3749f707b0f730af741a94f0986f0.camel@ozlabs.org>
 <7b7cccf2-5899-4334-9aa0-e83f0772d484@csgroup.eu>
 <7f5a74dd2e50877408a47e5cca7d241de7053579.camel@ozlabs.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <7f5a74dd2e50877408a47e5cca7d241de7053579.camel@ozlabs.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Jeremy,

Le 26/08/2025 à 04:24, Jeremy Kerr a écrit :
> Hi Christophe,
>> I still don't receive anything it seems. I have modified the status
>> of several patches over the last two weeks and haven't received any
>> notification from patchwork.
> 
> In your case, it looks like you have previously opted-out of email
> notifications from patchwork (for this sender address, at least).

Hum ... yes I should receive notifications on 
christophe.leroy2@cs-soprasteria.com , and as the three email addresses 
are linked together in patchwork I'd expect to receive notification for 
patches coming from any one of the three addresses.

Nevertheless lets try to opt-in on the other address and see what happens.

Thanks for your help
Christophe

> 
> Your user profile page ( https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.ozlabs.org%2Fuser%2F&data=05%7C02%7Cchristophe.leroy2%40cs-soprasteria.com%7Cf01234b980d04f2b14bf08dde447ae62%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638917718727770462%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=vov7L5o1fQrTYrDSPT6NNQHj5FWYjwgSosFMjGcudYw%3D&reserved=0 ) will list
> the addresses associated with your account, and whether those are
> enabled for notifications.
> 
> Cheers,
> 
> 
> Jeremy
> 



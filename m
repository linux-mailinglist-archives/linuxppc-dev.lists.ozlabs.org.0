Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B98146B2C0
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Dec 2021 07:12:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J7VLz3ZBvz3c5g
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Dec 2021 17:12:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J7VLX37BSz2xsh
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Dec 2021 17:11:46 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4J7VLP4XCLz9sSW;
 Tue,  7 Dec 2021 07:11:41 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Aubt3H6-ZS3E; Tue,  7 Dec 2021 07:11:41 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4J7VLP3pgdz9sSV;
 Tue,  7 Dec 2021 07:11:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 759558B76C;
 Tue,  7 Dec 2021 07:11:41 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id qWI3UeALxaWW; Tue,  7 Dec 2021 07:11:41 +0100 (CET)
Received: from [192.168.232.108] (unknown [192.168.232.108])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 477808B763;
 Tue,  7 Dec 2021 07:11:41 +0100 (CET)
Message-ID: <56402c2e-fe02-e697-7856-80830ea56e66@csgroup.eu>
Date: Tue, 7 Dec 2021 07:11:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: Fail to boot 5.15 on mpc8347 with either debug_pagealloc or nobats
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "mbizon@freebox.fr" <mbizon@freebox.fr>
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
 <69b0ffeb98a641c74f3beccf9dfc752bef96c51b.camel@freebox.fr>
 <3f99df92-0c3e-70cc-623b-7ebd6eca1e55@csgroup.eu>
In-Reply-To: <3f99df92-0c3e-70cc-623b-7ebd6eca1e55@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 07/12/2021 à 06:50, Christophe Leroy a écrit :
> 
> 
> Le 06/12/2021 à 16:48, Maxime Bizon a écrit :
>>
>> On Mon, 2021-12-06 at 14:22 +0000, Christophe Leroy wrote:
>>
>>> Fixed both in v2.
>>
>> Works fine, many thanks
>>
> 
> Great.
> 
> Could you then reply to the patch with the following line ?
> 
> Reported-by: Maxime Bizon <mbizon@freebox.fr>

I meant

Tested-by: Maxime Bizon <mbizon@freebox.fr>


The Reported-by: is already in the patch.

> 
> That way it will be taken into account in patchwork at
> https://patchwork.ozlabs.org/project/linuxppc-dev/list/?submitter=79086
> 
> Thanks
> Christophe
> 

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5BE8A26F2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Apr 2024 08:48:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=scram.de header.i=@scram.de header.a=rsa-sha256 header.s=mail2021 header.b=QU0RfYY8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VG6Zw0Fstz3vtt
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Apr 2024 16:48:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=scram.de header.i=@scram.de header.a=rsa-sha256 header.s=mail2021 header.b=QU0RfYY8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=scram.de (client-ip=195.226.126.84; helo=esg.nwe.de; envelope-from=jochen@scram.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 868 seconds by postgrey-1.37 at boromir; Fri, 12 Apr 2024 16:47:25 AEST
Received: from esg.nwe.de (esg.nwe.de [195.226.126.84])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VG6Z535Jcz3vrq
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Apr 2024 16:47:24 +1000 (AEST)
X-ASG-Debug-ID: 1712903570-1ed71d5dc82363b80001-v7v7hK
Received: from mail.scram.de ([213.206.175.31]) by esg.nwe.de with ESMTP id 2CinZMVeoB7m5L6B (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO); Fri, 12 Apr 2024 08:32:50 +0200 (CEST)
X-Barracuda-Envelope-From: jochen@scram.de
X-Barracuda-Effective-Source-IP: UNKNOWN[213.206.175.31]
X-Barracuda-Apparent-Source-IP: 213.206.175.31
Received: (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	(Authenticated sender)
	by mail.scram.de (Postfix) with ESMTPSA id F29EF8A7031;
	Fri, 12 Apr 2024 08:32:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.scram.de F29EF8A7031
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=scram.de;
	s=mail2021; t=1712903570;
	bh=Gh1QR2+zPfWSt6AeuaYH86pSHzi1XIf0LhYJrlsTzsg=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=QU0RfYY8DbePZ5cSqGjXgEv7Vqq8xXXIJdVQk1JyOqck38FEgC4x4H3/iUqgARSmp
	 w/FjXl7ccBDgbfreaX/myLtF/cvSFBvQddT0I9Vr126eXMNC1gHQ5Fe2HBPVZf382k
	 oaWYoJzQMfqct/IRNrqiFhe7B7263vktH3B2taw8=
Message-ID: <2271dcf2-83c3-4570-87f5-c483faa2f9cd@scram.de>
Date: Fri, 12 Apr 2024 08:32:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/64] i2c: cpm: reword according to newest specification
To: Andi Shyti <andi.shyti@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i2c@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
X-ASG-Orig-Subj: Re: [PATCH 14/64] i2c: cpm: reword according to newest specification
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
 <20240322132619.6389-15-wsa+renesas@sang-engineering.com>
 <jpp67ejeropvsc6gwompwc5t2nbl6cde2o33vtf42e2on2ycal@42ovfdhp6oh4>
 <maxjcriuq6qfoeoing5ic7l5pnxdyylovjdoh4w3bzhnmco6ax@mslv35p4k35k>
 <26y3smrxv3q56peuqatospr3q6annxvdmleyhykyrjrovne6mu@yg44mmr7aaqp>
From: Jochen Friedrich <jochen@scram.de>
In-Reply-To: <26y3smrxv3q56peuqatospr3q6annxvdmleyhykyrjrovne6mu@yg44mmr7aaqp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Barracuda-Connect: UNKNOWN[213.206.175.31]
X-Barracuda-Start-Time: 1712903570
X-Barracuda-Encrypted: ECDHE-RSA-AES128-GCM-SHA256
X-Barracuda-URL: https://195.226.126.84:443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at nwe.de
X-Barracuda-Scan-Msg-Size: 423
X-Barracuda-BRTS-Status: 0
X-Barracuda-Spam-Score: 0.00
X-Barracuda-Spam-Status: No, SCORE=0.00 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=5.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.123398
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------------------------
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

>>>>   	out_8(&cpm->i2c_reg->i2mod, 0x00);
>>>> -	out_8(&cpm->i2c_reg->i2com, I2COM_MASTER);	/* Master mode */
>>>> +	out_8(&cpm->i2c_reg->i2com, I2COM_MASTER);	/* Host mode */
>>> I2COM_MASTER might be coming from the datasheet.
>> Maybe we can just drop the comment? The value we write is pretty
>> self-explaining.
> indeed.
>
> Andi

I also agree. You might add my Acked-By: <jochen@scram.de> here. Jochen


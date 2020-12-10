Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B14F2D613E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Dec 2020 17:10:11 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CsJm02rVhzDr1Q
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Dec 2020 03:10:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=web.de
 (client-ip=217.72.192.78; helo=mout.web.de;
 envelope-from=markus.elfring@web.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=web.de
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=web.de header.i=@web.de header.a=rsa-sha256
 header.s=dbaedf251592 header.b=JmS8UaJg; 
 dkim-atps=neutral
Received: from mout.web.de (mout.web.de [217.72.192.78])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CsJgt64mRzDqxL
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Dec 2020 03:06:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1607616251;
 bh=ztP3o3sZxYRK4WVRjBBhx/FXiHkMoOmxJ5iurRyi7zg=;
 h=X-UI-Sender-Class:To:Cc:References:From:Subject:Date:In-Reply-To;
 b=JmS8UaJgY8rj0KH0Ety71br1F9CSspJutIDSkDcKwNV2gaQhtdvoMMn9HWGTRQNWl
 XvcY3UagJ5BlForLg8LcI6HjBgiRdivmjOQ5FsfxywCiJVQGJpxm9qD2lx0NEawi4k
 juLJXa6oTl9TjHyYjXxNnZN6fKnvF75HWh6rlXtM=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([78.48.143.229]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LuLxD-1k6JkS0hkN-011gBF; Thu, 10
 Dec 2020 17:04:11 +0100
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linuxppc-dev@lists.ozlabs.org
References: <5cee2b25-71e0-15aa-fba6-12211b8308aa@web.de>
 <X9I1GLYCkw/q/xMu@kroah.com>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: =?UTF-8?Q?Re=3a_=5bPATCH=5d_cxl=3a_Reduce_scope_for_the_variable_?=
 =?UTF-8?B?4oCcbW3igJ0gaW4gY3hsbGliX2dldF9QRV9hdHRyaWJ1dGVzKCk=?=
Message-ID: <507d607a-0551-ec11-e1dc-5b9c96a361cb@web.de>
Date: Thu, 10 Dec 2020 17:04:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <X9I1GLYCkw/q/xMu@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:4JJr1h43tgpOGmxflHVuWbLH6M1grYZ3NkCJJhvajildAK8uzq8
 upVTE/sg3syYGJoX9lf1qR7kMMhRNR9pRhTCAdNLrfrGm1UxpgWbRiwZS3nAv4MAGs06odi
 V5SvSK4uGGphbOJHqLxkgwjrSsJexdz36lG7QD8qz99iZ9vANiPmfbI1ssYUYOlPIJYs/QQ
 yzn8/M0lGMnMjzuGMYJ8A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:OVJ8+f+RmA4=:mC3BW64m0u7F+ifM+AWWkI
 dYWKYgPbe10mnqj6Xcw+r4pvXm9lD1JRC+oZqp0gXOQwXZS4TFKNom/MhhthWBpLc+/EV7CT/
 hgsvErTo0oaDHeWlsAW0ypmg43VJVJxC52/zZlCjozeysoe2NzRODJmgU0zx7Ere+AxaRYdHy
 Og/Dq3pnufmCm72CWXiC/D9diEdvMZSo0LIRpBLM7EEtnsl73lCjOshNk3WJiHNkOcajlB0SS
 t6xzeB7OjavzMygzSnr27r7F1cJIBpamPrjPlnapUFo+y8NbAyZV4r2sLOYJagbwLl5bi2zds
 fRQ3jpYWO8Li8BVQCnbHrSfZ8K5StBP+4sG+ymWizHiVNmqhidYbSyWv5bZw8NHYPZDIeDv6N
 nPxltIYATxzSOPjZ/Pnu8aAmgytf+ITI9Yav3XBDI/HkBZrFR86TaGf8U02PyRp70Rjb6cO3O
 tZNM2CIhB0T9N1CZsl10PMVwOMkUGLpXQ1NAyybvQwpJ6Zri8U8m4lsyMDr79c5FjiaezDO2J
 fxvWG1b6X/U/G4tZuQfCfk2Xuac/lSt1ccCSiQxMfOyGCjBn7l35saFjS8FXgPeMohKSz+FeI
 jfGLWw5EUyi0GjnJnttw9OfDj7X9wLc/4k0uWEeJ7dmoqWaPEvBrtk3K4AvplpW4DnXyLfqyV
 +9I7J5VIPoFw2B5GxK7ZBVh1GlnRmecp98UWqqEI7EimY3Qvyf8GHtYCPRN4rd1VPiXZJpln5
 8u7fDYtA0H6Hlkp2DmTCMLZvwSaq3hOm9mFcTr3VXA+eg0VlATPiT4gZQo5HeU2aq5ZapnN/g
 2lZTtUJB4KgihCYo7fQMiDZl5R2EutwcMHYlmWeQAC2Rh5qs4yvl38VrsvP/RGMh6IZzor1qK
 uLiGi9/sSiHePLqKu1CQ==
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
Cc: Frederic Barrat <fbarrat@linux.ibm.com>, kernel-janitors@vger.kernel.org,
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

>> A local variable was used only within an if branch.
>> Thus move the definition for the variable =E2=80=9Cmm=E2=80=9D into the=
 corresponding
>> code block.
>
> You did nothing here except add a checkpatch warning :(

elfring@Sonne:~/Projekte/Linux/next-patched> scripts/checkpatch.pl /home/e=
lfring/Projekte/Bau/Linux/scripts/Coccinelle/tuning1/next/20201204/Flicken=
/0001-cxl-Reduce-scope-for-the-variable-mm-in-cxllib_get_P.patch
total: 0 errors, 0 warnings, 16 lines checked

Regards,
Markus

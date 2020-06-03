Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF301EC9DA
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jun 2020 08:57:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49cKVX73jhzDqYV
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jun 2020 16:57:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=web.de
 (client-ip=212.227.15.3; helo=mout.web.de; envelope-from=markus.elfring@web.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=web.de
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=web.de header.i=@web.de header.a=rsa-sha256
 header.s=dbaedf251592 header.b=eUlntA16; 
 dkim-atps=neutral
Received: from mout.web.de (mout.web.de [212.227.15.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49cKSq2z2szDqNL
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jun 2020 16:56:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1591167372;
 bh=C0/lrnZna4gVvcljuyBvlFX+3mBGVOVeaC5jh9KHQ90=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=eUlntA165H9m6P7gZO8Yyt5stG8cRMb6MszfvXyiGpTNwszRkUEsdTZrq6aPQf4Sk
 ASHeJhTU6PqnIOPbn/l011E8lv9Rbnf/WscapIUvWO+cah8ewV4TGdXoqSvNBnWc5b
 F0FKsL3HgXKeQxI/s16Av24tsUNbnFZq8N6wb73o=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.131.82.231]) by smtp.web.de (mrweb004
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MNg5K-1jddV00nko-007AMJ; Wed, 03
 Jun 2020 08:56:12 +0200
Subject: Re: cxl: Fix kobject memory leak in cxl_sysfs_afu_new_cr()
To: Wang Hai <wanghai38@huawei.com>, linuxppc-dev@lists.ozlabs.org
References: <b9791ff3-8397-f6e9-ca88-59c9bbe8c78f@web.de>
 <25ad528b-beaf-820f-9738-ea304dcbc0d7@huawei.com>
 <20200603061443.GB531505@kroah.com>
 <20ae5516-7e41-f706-46ba-955e1936f183@huawei.com>
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <eee5161b-e7de-c260-9f54-427cccae486b@web.de>
Date: Wed, 3 Jun 2020 08:56:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20ae5516-7e41-f706-46ba-955e1936f183@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:CI9x26801qgto6e2qo5DcPgBFgq2Cw0097mz+PLuVntYFtGi0RR
 2zQAnr+ip2KbaFOrjxhQnVxlm2kuyW+AsA9LESSpABY6EpbKgZNLpG1ONkt0C0Td2nDbPYf
 HLcXBBxZtqumtfduYE0X8sTUp1FbTE23m+th6Gf4+g0Jvir45g+I8l0XKtRn5bxBxOGcBlH
 hH/6J4F/y2mNa8m2KSRcw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:EPOgsv2oE8U=:7+9buTWG57PiBAY8m9Ueni
 vYfsZg4Je53KEQGj74J00JtIqOlorluCksMmtK8LiReevj6DKHGtwoe/MDYOCs+9ZqmzXVJse
 SKqZcWP3eguQwUeHW4qoKk4ipEliUbM8URLKMReBbt/BIZW8o4U+zvso43Xx4/2awH7j/PqVg
 5ogwkebJs7kyMNUU2kflML6mKYaUPFh9AB9Z5tJaBVe5CW/CWuGLyDOQ3ptUxbwWhNEdbJzMH
 UT9PmnJ/7rMfRkVWMxD/mwdJKwbON81RLuwEE3z5JnqSTEJCrqRG3om2LmyIg5/PWl9TAEnXW
 s5ackNJYs4oW+R194XxAcbDY+Vk5faY6tjeEghys3uyoeuCroUpGDzrCAe79ItE/8chC3tLaz
 3ys2ICF0yCsL/T9p3yB4y28PbT5yFePdbcBkh35/Q6e9tMVw8ZAYZoA/ybPYn7vuR4sq9hPUz
 xcIk+QU4GnrkovLPvIE/R9+vwsaN7Lwmf8rhjvVo4vmeQpTNYq+6Qv5aBWERkWuZvcUZrcGsZ
 GmKIxtHGMKn4e9ySoCflBOzyQDpMtpTuvhLN+s0d0WFVMRvyYckA3juJvkvHGp+YSJ2ysKu/l
 8fJlVon5Nf79biE5fQPXVTo7nv8phwOwMveVtnUE69MA55q3tf208Cg4lpenRkh1rufFtprrA
 G4WGb/Pw7v2gZYLSBviFoJyq8wnEhDqQmtSreHRgATLP2RKHlFg7VGuoa1gw12zKM2X+DWbma
 Z/6HnYja7hqDluIbsU13NW3wwRamB3Z5qo8YM1fwskSdCZiggI25bHYtinQyBEBC/LkLqXPFY
 UCtR2E185+eS/6DQymPcFdOa+2t1XsOXLlW64XIXXGL14RgJ1JNGYDxGbbKQRim/TLz1bilv+
 WFM0r5Gb30pAqc33enfdbAK3emgFXAXdNjxaXhUoTcBDdjx0JP9vHyFRdpHo2b+aN2gdHcqBA
 DFuAHzIgHPRLgTJcwYH5f7pfb8MDNNHQ2yootau03oGkLC5USnVu5mCQ9VCfLvHSYpyjU+Hgy
 QLU2FnjZcsvWjsS96cJclp6NjB4ZjBtrRoqQVbzK5QAblxu2yWZUnPQMXU/g7Teqy8ke+TEW7
 80pB6bx+D0pGPMnn8XgKgpcav3XdOzjAD2hVHUq7aof5zgr4dFmzl3NTPKeNduU4X8WIXWjcI
 xmyHegjSGPoA/tEnhxYTuh4qyZr0YhyLCPfe/ydnwSFq1fkFkVfXs3Xw7Pq2p0JlT6XFTd9x9
 KL7Gfkrq0s8Nwa3b6
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
Cc: Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Ian Munsie <imunsie@au1.ibm.com>, Frederic Barrat <fbarrat@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> Okay, so I don=E2=80=99t have to send the v2 patch.

It will become more interesting under which circumstances the presented
software development concerns will be taken better into account.

Regards,
Markus

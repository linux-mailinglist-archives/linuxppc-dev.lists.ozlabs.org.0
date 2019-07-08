Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E9D62306
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jul 2019 17:31:56 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45j8ZK3LGLzDqGk
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2019 01:31:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=web.de
 (client-ip=212.227.17.12; helo=mout.web.de;
 envelope-from=markus.elfring@web.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=web.de
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=web.de header.i=@web.de header.b="Z4+TYFdS"; 
 dkim-atps=neutral
X-Greylist: delayed 346 seconds by postgrey-1.36 at bilbo;
 Tue, 09 Jul 2019 01:28:20 AEST
Received: from mout.web.de (mout.web.de [212.227.17.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45j8VD3jHdzDqGk
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jul 2019 01:28:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1562599684;
 bh=5jkFKCmR2GUwlsa0zrqotc5apw9/xdj6vpIuoJNsaqY=;
 h=X-UI-Sender-Class:Cc:References:Subject:To:From:Date:In-Reply-To;
 b=Z4+TYFdSY7LPaxw7H9P+dCcgUn1/YFKTXshEpkpUqK+Djl09gntbAhOtiN4HRrRrX
 97EsnZJ+9gYDf5/+uM1/jPPx0Z6tVYXSifuqpRHeENfjSgFKTMcEhEtDS5nH8yP5JX
 pSdc/QJ1oa3oTKdX3GjznoR9qIo7wwXy0anVPu3o=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([2.243.165.233]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LxweO-1iY5Jl29zQ-015Fl3; Mon, 08
 Jul 2019 17:22:01 +0200
References: <1562317084-13140-1-git-send-email-wen.yang99@zte.com.cn>
Subject: Re: powerpc/83xx: fix use-after-free on mpc831x_usb_cfg()
To: Wen Yang <wen.yang99@zte.com.cn>, linuxppc-dev@lists.ozlabs.org
From: Markus Elfring <Markus.Elfring@web.de>
Openpgp: preference=signencrypt
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <99840e11-e0e6-b3f4-e35b-56ef4ec39417@web.de>
Date: Mon, 8 Jul 2019 17:21:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <1562317084-13140-1-git-send-email-wen.yang99@zte.com.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ckcR2+VKOSFUJ6uGz6jX9tWXCfRXHX1jSP4nJJRSoovyDhyYsES
 DkzoLdCYgB93ThN0rp+s/yzpSNxRzSHPwuVEsuRVwmNYjgFPY4hwabDTX4BTCmQ2HJzNOom
 7I205/htlkGNrag104lMhr74ihYdlMTHjC2t9Q03CgF/X4hTOyPTiEfrN6k6obTMYPawblv
 ifzD29BWnQf9hE0T4z4eg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Fd8ESU9rTrk=:tqCGgW+09IZBjqd5OtfbIh
 ue8UPlMtYLdo6LQv8kz1spHceKBMSN4qFx9aQca2y4Edhprun4iQFl0eZ4ENREKq1zqiwT5Gz
 hsNzhGGRTxARVoejXbearo9DrpfXFgbDFsi8vBo0vyQMOXZLYqzfzmPlXj/jZg5BFpOgXrvqB
 2XGi2FeoJ6zfGo/Y4gulSdTq5ZSwdljkQ8A76JufvlTV8QNkbyF+SYHYbOM42nA+PBJHOC64Y
 eioO8JzCFfp5gDwrit4f/ZULB/vblExj7OyxEcsAgeCBzGTVb3cpjuP4468jQ+yhVrst2+zsw
 9T+Ko7Rd6EQTNwRQbxEEBdV1y7+AzvnaeVp6Ca1jlfKQ522whA72tKxFUWygmLvdUAZJnY/Ky
 5HK6KIEHzwpX6oujh4uYeGpfrEHubMn2DwaSqZRLBFUTsuAr8xbWqrj/+f84ohAts7ihHVnPE
 RaMmnpUjKIlWv0l68mqw8S2U5oM/siPCJXTF0xNE3TCVYzU5tEq3J+dLVMAQbs99r6oWUHRWW
 18KgZUk+VnovEsrS44e8YBi/k/klfsB1enKyHngfyrsetnhIKDmw2YGplI5Qg/hX/uNesSalH
 R9Yo0dU6rbJssvs/xvtZkZwKBDHdhkwGrRXxf9L21sgqla5HIRZsbkFjGsdEXLXTuXzbh72MU
 ho4aHvsgRPZb+yNZZjBQbL7FgAivl9/7len7HbrwXGyk9vYJ2wM78O3HHVacNzxPlebbCGSIs
 kPohBdPGBr30n+BHuwKV1N2ToRk5t3jd2Ezf7GIXe7+k3nLNWIt6T2czswvm0J5HKyqx+zrUH
 hhaGSBt9I2Asolr4J5JkQaLplauiygJKg9D2ANXDYsTSL5j3enrKhGKTPfaQ65U61bPrS7E7u
 gPPBYG6EZs0rPnvOiL/3EqZ4cWX4r8p3YcjxBU6y2xyjFKk8/rXIQZmfjgGkUmmTsUewVyQbS
 epwoGjezgg/1CJk4cMZH019NUzimnGeasVitZ5m/icXyZA5IJH5hBz7SjrdOFHR7np6GXNhiu
 jf+zd0mWWdFoagjxWo2+jSnmDhynvxOLtWct6RYbUj1ZANE160t8TkQxrblMJ5+lAj0qhX4cO
 R3t3on1pTtEUlgcgr9NNgeio/nRj6hs4pNk
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
Cc: Yi Wang <wang.yi59@zte.com.cn>, Cheng Shengyu <cheng.shengyu@zte.com.cn>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Scott Wood <oss@buserror.net>, Paul Mackerras <paulus@samba.org>,
 Xue Zhihong <xue.zhihong@zte.com.cn>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> The np variable is still being used after the of_node_put() call,

> which may result in use-after-free.

> We fix this issue by calling of_node_put() after the last usage.


I imagine that this commit description can be improved a bit more
(by mentioning the influence of =E2=80=9Cimmr_node=E2=80=9D?).
How do you think about to omit the word =E2=80=9CWe=E2=80=9D here?


> This patatch also do some cleanup.


Should the renaming of a jump label be contributed in a separate update
step of a small patch series besides a wording without a typo?

Regards,
Markus

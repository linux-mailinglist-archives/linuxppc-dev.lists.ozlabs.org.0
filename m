Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 506B465380
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2019 11:07:01 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45kqtn6rfdzDqS1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2019 19:06:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=web.de
 (client-ip=212.227.15.14; helo=mout.web.de;
 envelope-from=markus.elfring@web.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=web.de
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=web.de header.i=@web.de header.b="aiM75+U/"; 
 dkim-atps=neutral
Received: from mout.web.de (mout.web.de [212.227.15.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45kqrh0gcFzDqJQ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jul 2019 19:05:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1562835861;
 bh=0tLRWbT8bBxRaR5RfH0jviIDBAhhwCwmVOO3QefF65g=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=aiM75+U/I6OU4nxzNdtQyavDvKVLyANEjks/WZJV8BmPd+9QaBL/F3jwhAU86RA3x
 eka3SIk5iF9J4Uq90onC6Mq66mCpjUu3DrSoOAuMuTjZ9qswFQe0K5ohSG27VPPZM+
 s6bTsk+eVMlgLiQsf6t3bsDRvVqBOWDcoZTL0GH0=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.132.182.165]) by smtp.web.de (mrweb004
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0LegAQ-1iGeQV0dXa-00qTZk; Thu, 11
 Jul 2019 11:04:21 +0200
Subject: Re: Coccinelle: Checking of_node_put() calls with SmPL
To: Wen Yang <wen.yang99@zte.com.cn>, linux-pm@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <201907111435459627761@zte.com.cn>
From: Markus Elfring <Markus.Elfring@web.de>
Openpgp: preference=signencrypt
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <90e538ac-a1d8-8c21-34a8-830dd9a07a7b@web.de>
Date: Thu, 11 Jul 2019 11:04:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <201907111435459627761@zte.com.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:9RNU8qY6xcsR+ujnesLnOasysSPpyrZB+HpnaqUCNo04Re6ran2
 ir2NEuvVxBQdimmcXV7fgs+Ffh+wvC3eRjsWOZmujoGT/L3dhH58rJ9R/G0zu79fTRoMEFw
 m1PVrkVpvChyobpWT0PosOG/xjvoQgtEQFXPOWtjfHW7VgGuleI+4DEpMtCAtthKaMciJ8C
 ntu6uxD1Ul2w1/Jg1ZbRw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:5VucwHuFbjU=:0dFnGsejHk/MbQPs3dcOSO
 TM7ob4pb4ZpHEkTuyHHrFON3e2A4LuW5B2XyqvoDXetsPUHgye19xdYM3gX6zVyRpuHbSll2J
 NpmL6kym89LL7C+1iO3yAebAByOfOa+cc+hBBjnKIG8ZaVCAMoVD5IBo4PiEdtewU4M4IWAv1
 iFVhMn8FM1jTYiMXH2v4/pxi8Wxi3dMALGe8dFiUPXlPDhDn//n7PCCZHiHo991XTe35h49Hq
 wovGUX+7ymm21FEfyzjdb2pLpbAUn8wcD+GatsDNSnGVpZPmMk6W5dW+y61LdcjIyqfWqUvHB
 BVB5JhTbEPBZLYYHwVjUfLhCebKYXJz+v6DqQ2vEppnK93omHFyF59eSOZ1lE1ao4X61PDEBf
 l/wmIMNNUF/F+irE7re+WFhB3ysgbLtYjBYTvwIJoBwjlhkYO2mxFc+vuYisT1BHOjiULt/ra
 Y9f5p88k35n8V9gzETGEWapbuL9d2xAN+JEFVvJ1BD0kKysF6bJCQQPq2eQ4Ar3e+O6oa2Gjv
 63HfTSKxEx+8OPQkQzXWQOpBbjJ9UKfKuzPPvyJqlEzrgbKm8uk31Me5Vf/r1nbLF6W5thoFe
 azoW1MVjPH5/aw0Ceob1L9QO21IaQTgQkT/BkkGX7/EApHn4gKDNZ4WFShD1ynwa2r4RI4YU4
 87rSP2wcWwcI+ntuROz4aWP+TEphC8B2jTRx8z88m7Pzyb9/y3ifC4hl+SbTmvPjywSC69dHR
 ktd24WWuMXCLXvKM8v1EQSCNdH8yptjCj66DTqiqZ4gH5pFbdANqqMLA7c/6w4xUMnx+tzBAp
 Cl/XvFZm5osg/YiDHmATWl+XtIBoLIFjwHe/NTWnd4CEEHa/Dgw2lSR3YkulxDBiRGB5RU7Zi
 rCqKfSUUPAyXXd1XYReNUD78v6dJ6lXKsj4oxHczhmTq3O/wN9m1K1VvvX6zhpYZGy91954Nl
 whtzN9L44tFHHW41nllIvgJ/sYfcjn46VCPBpwJn+0JzSHqysbU2uYU5nA2WeXVn1xA+sve4v
 0QxuGO0rHeRTSTnzEiLGfVT/9fkYe+LSQM2mi4NWlWg23y0FkwruiPLLE88MnbFmzyPUWQ2ta
 eEagrkYDzYZDcLnXu0sFlEp6rnoL1Ggw229
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
Cc: Yi Wang <wang.yi59@zte.com.cn>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 Scott Wood <oss@buserror.net>, Julia Lawall <julia.lawall@lip6.fr>,
 Paul Mackerras <paulus@samba.org>, Xue Zhihong <xue.zhihong@zte.com.cn>,
 Cheng Shengyu <cheng.shengyu@zte.com.cn>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> 180                         break;                         --->  Jump ou=
t of the loop without releasing it

The device node reference is released behind this for loop.


> 183                 if (!of_device_is_available(state_node)) {
> 184                         of_node_put(state_node);

This function call was added by the commit =E2=80=9Ccpuidle: dt: Add missi=
ng 'of_node_put()'=E2=80=9D
on 2017-06-12.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/=
drivers/cpuidle/dt_idle_states.c?id=3Db2cdd8e1b54849477a32d820acc2e87828a3=
8f3d


> 185                         continue;                    --->  Release t=
he object references within a loop

I became curious on the applicability of an other coding style
(for a software refactoring) at this place.
How do you think about to achieve the same effect by using a goto statemen=
t
instead of two statements in such an if branch?


> 208                 of_node_put(state_node);  -->  Release the object re=
ferences within a loop
> 209         }
> 210
> 211         of_node_put(state_node);       -->    There may be double fr=
ee here.

This information points a recurring challenge out for safe source code ana=
lysis.
How would you like to exclude the detection of false positives finally?


> This code pattern is very interesting

Thanks that you think also in this direction.


> and the coccinelle software should also recognize this pattern.

There are some open issues to consider for available analysis tools.
How will corresponding details be clarified then?

Regards,
Markus

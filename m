Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 16BAC6392A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2019 18:17:02 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45jnWv1P9PzDqY3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jul 2019 02:16:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=web.de
 (client-ip=212.227.17.11; helo=mout.web.de;
 envelope-from=markus.elfring@web.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=web.de
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=web.de header.i=@web.de header.b="TsnIo7g2"; 
 dkim-atps=neutral
Received: from mout.web.de (mout.web.de [212.227.17.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45jnTk3r2zzDqD5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jul 2019 02:15:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1562688862;
 bh=7AvscNaUyn46hM75gtW7KfUDkg0M/Ds7TxLVZ64aVUU=;
 h=X-UI-Sender-Class:Cc:References:Subject:To:From:Date:In-Reply-To;
 b=TsnIo7g2U/yEiywEhtQjMTiyY3nQ2vQSWDru49m8+yIcdy842yLQ0Zi7lKemYMyiM
 yRp+XUKf5L5bm6WLtYKkg24l4LkoR2LRO8tuFGfhm7VqotcFFuMtGzuSGc6jcHBE62
 2fuEhX0K4wJ9Ca7SwCJ3nnx7lAoY3IHfoJFut7Gw=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([78.49.179.96]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0M6V1T-1ij0gY3rwJ-00yOgq; Tue, 09
 Jul 2019 18:14:22 +0200
References: <1562670768-23178-1-git-send-email-wen.yang99@zte.com.cn>
Subject: Re: [PATCH 0/2] fix use-after-free in mpc831x_usb_cfg() and do some
 cleanups
To: Wen Yang <wen.yang99@zte.com.cn>, linuxppc-dev@lists.ozlabs.org
From: Markus Elfring <Markus.Elfring@web.de>
Openpgp: preference=signencrypt
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <4e7b5f40-e619-3c42-0ae9-0164ad3ecde9@web.de>
Date: Tue, 9 Jul 2019 18:14:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <1562670768-23178-1-git-send-email-wen.yang99@zte.com.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Zh/YiuiQIuShWdDeyIIoptspV0H9puG8KVA3xiihz00O/OTIohd
 jVUjFCudzleAxVe4GuaR9zq7riKFRSf5CQwrfT/tTOcsaEBiXFpZGb80QV+jp+vKf/SWrKx
 avYvBFSPqHvNLiSS7fHwCnqowSkTAZ43mlFFIYZNP/4ccGZOBrYtyij9AEa6Fh034hrxKEF
 whUKzNTNuZax+u4DZXh4A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:tUGoJ3dy6uI=:X7RyLl2u3stUCULb0xVDEg
 qf4psoNdC7CsYY1MiwIC+Tw0lq03MQl82OiNtIBQ723r8XBWVXY992usXjys44QcEa0KbdhWW
 3cD9SQG3JHicUDOf9xSvZnFiPkktabRS908uGMey6BvoPk7dNUc1imC1mrg/UU1wKnopLTx8E
 4tJfG1Ozkr+0II+GltsAmzZNWinxvTYWp7sf0JtjWGB64J9Y+TjoU9D8UGwHGhppD17mG9Q0t
 RvWd0s/kC22Rs2Sr4f8gluQ710kJCzMFUCWRoMoehtSjsMSf36KaW5snmCIStiC148jSJHJlf
 GCwk0SdBFqauQIkfILvs5FEhg0EIUFGzVl6sgyIkvD6GTJuG/GgebVq4mrtj7n7mLV+iADY5J
 eQqS213GkhgVuQ9AoOwnOffphBPwWS8GAr8wNVkaaA/0kIzeBAqLDzpei8BSY+IAcOgdGGZb8
 HIEyGFz2C9FkBcp/DvIJxI5paXDK707n80wyy2QKtBl1hWVpZ0ORC5Gwa5eYMAZqMBt30EXWv
 sOdLWQAZRpy3Gg9p2cnREoMfQLu+6QYSINglsTs+ttZMb0rbqM5KvuQCMIKmj9kyHrhq98fBU
 +qR6tfMoEiWarKfWo6E1bGIpYcuDsiuCzdGy+QB+XW1Kgmb/HrNHj5CNow2o8UoYpfcfiKCBa
 hyOJGLAjrNpErGMykvm+mUEQEZjMgAO1LIop2VDbLdOxcmD6zW5JAvOpMmxz9tojzC+lLtUgb
 B2s/eIpeR7sBy9huqUFIdWjuVzcseP05O0g/ESqZmpp41Q9GshzkQe4LLfId+LeCZ2ha2zeFI
 C+fZhg1xvyHEwQ3fqtIKtILpw4y85GR+1QhXLWbAERw09f8Q77OikXGc0M7EPhXsKBgSsZpXC
 eEyFB2j+E7YEpSnN974JiwAtkWRjjZH/KBQovlZHfT8tGSRYd809FcmpSZWcqOlAL9pz9pz4/
 2S1u1OAvQtslCrO8ZWmEBgVWZn41/yLnVKH1JI0DltnPQT//W7SaleFeFaNlA80AtDiuIYcc0
 8rBqWKcPk/wUjLpFtwSp8c7h6vMPv4Wcj0fnrPAwBIh2jfC9ux08sKLbzCZ0pdfeQBRAcAdUn
 Is7z+h96UCXuHoqK+RQva51EocF1qRx/pe8
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

> According to Markus's suggestion, split it into two small patches:

> https://lkml.org/lkml/2019/7/8/520

Thanks that you picked adjustment possibilities up from my feedback.
https://lore.kernel.org/lkml/99840e11-e0e6-b3f4-e35b-56ef4ec39417@web.de/


Now I wonder why you omitted message recipients from the cover letter.
Please keep the address lists usually complete also here for improvements
on the same source file in subsequent patch series.


Can a subject like =E2=80=9C[PATCH 0/2] Fix mpc831x_usb_cfg()=E2=80=9D be =
more succinct?


>  powerpc/83xx: fix use-after-free in mpc831x_usb_cfg()


This update variant is generally fine.
I would prefer to avoid the addition of function calls at two places
when the corresponding exception handling should be specified only once
at the end of such a function implementation.


>  powerpc/83xx: cleanup error paths in mpc831x_usb_cfg()

I would find it clearer to fix the error handling in the first update
step completely.
I guess that a renaming of the label =E2=80=9Cout=E2=80=9D into =E2=80=9Co=
ut_unmap=E2=80=9D (or =E2=80=9Cunmap_io=E2=80=9D?)
would be an auxiliary change for the second update step.


I am curious if different preferences for change combinations will trigger
further collateral evolution.

Regards,
Markus

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B37719EE29
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Apr 2020 22:58:34 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48wQxg0fJSzDqw0
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 06:58:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=web.de
 (client-ip=217.72.192.78; helo=mout.web.de;
 envelope-from=markus.elfring@web.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=web.de
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=web.de header.i=@web.de header.a=rsa-sha256
 header.s=dbaedf251592 header.b=AysIE8/+; 
 dkim-atps=neutral
Received: from mout.web.de (mout.web.de [217.72.192.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48wQvS2cwMzDqLb
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Apr 2020 06:56:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1586120182;
 bh=L5/N3xSigmklxeD1ymKp+JH5BKifrxRltrU6xDXr994=;
 h=X-UI-Sender-Class:To:Cc:Subject:From:Date;
 b=AysIE8/+pXbv0OehTrbOnjY0xyQQKEa5ujPDxv6pzLY6x/ecQvtRGAySUImP1/Mkf
 Hi9rSeoBKRWCBnkduWKKOAtgSvNUdt1QnRh24qEulEsupl0DzS98PtwSzD/y+FpW+S
 O/Y7+iguffXq8ruz4JlS0KZ64nPQI5IpzGAcmW20=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.3] ([93.131.99.70]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LnjFb-1ipBWE0jGB-00huTv; Sun, 05
 Apr 2020 22:50:37 +0200
To: Qiujun Huang <hqjagain@gmail.com>, kvm-ppc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] KVM: PPC: Book3S HV: Remove NULL check before kfree
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <a2e4aca0-8e3a-2496-b9a3-ccacf41fd3d9@web.de>
Date: Sun, 5 Apr 2020 22:50:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Provags-ID: V03:K1:80B/Aal5AECJPwEtbqkk0UHESLMz2OExeU8BxY0Qi+hRjMDcF7M
 DEDZljjKE1kjhvFQeKXwPN3/nAvVXDSKFDmk6bxs++iMfeq62w3pxcV5Rx/KCELMNP8FjpC
 YSsCozqDKXT+/zptYMdUXZloHyBui4hDQL7Z8th/QZYlJiYEZgoC7sS7TkkpTgxHzAaM3ZO
 LaKcO/tWs2IUjWBAhX1UQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:/v/kkytTxDE=:2Zj9NHgm3BHgWVPdVBYPbg
 5LeGKHLubIwzMgOJ+96cI51ZD9U9LL/ARiM4AyZZVMoJ4lzCNYiPcfeNdRiPPeP+jYokrQ2IT
 0dZ+X14nEe2HH2SsB9pHrcqRGBOf5PwAfMSGZLuSGMlJaJKTgE8cNGat3+JINDDYzQKDOFS2+
 Gkt2k0CGVU2mc30SXBXTokvhiUXrxM//H+9MQZxOxs4cyBjD7zfkiNp73qzoVHtcXTRzuJpyV
 mKFuY5/yrLoZeaRQrpnp50u+fRaOpT6fdf6WCPbw9VeYPpp/7W1ws+oobyFA75BXnzm4okfte
 VQR4P/nxs3tkLDvyhCgtME1XnprQ/6Hips6EjARKGkI0Fw8yZd/wXBsheK8g3WXOjiI1T1pX3
 2us9M73i84aj+exFOSU1rRjxHxW8Qg9PrzcKAvAQDqiu87uPAcsRAs0vskqsXBFBNW1rqbTBB
 2X1QaIcBGm2qzktTnuenwhTa1i7+5bkyIdxJpcqivR0fOKTRtsPHQGbFIgrtd5RnEcbXHgQXi
 hBS9Ef3qXihsEqI9b6GVvmE9Hx4PZHKbm50FOV1/oWIpDZ7qQk2T0WNIU9nMRDlFJFvme76bc
 EevU4OefU1tVx+jUzELlkgqz9KxKKXFtuPzkdgs9OZuvCEkjoKP3hQEIKRdSaCT4S8nMHoMtp
 JPT2EQ8J3ciFXy4MzT+G3TD8ITcSu7Fvs3UWNnCE7d5rK3jYBiHTTL9+SGI7oMkpygIk+NW/r
 8Ymv6wJOklsENMocidUZgVBx5DMG+517RqAIrrIrTa2USZrt/qPpYV9ExVwCEFP+gk9OLCG8Q
 G6j8iB99nRYwjB6kfpdNADK8qqP9C1sdTun1B9Rv5jyDvquaSyr/sHDogGZ19mLq1uWTo16NB
 PuOCJrq8Qgh4CFww8yrBharTSf0e5LyIeif+9J82WX+J4bkgZcf4XPw1s6tz1THtGvUHeg1wm
 YHh8Mz/ZgkRsb3shtHAbWQPuS2MQ0hAiuh37tfw9kjhu4ID4/c3igw9dZHmxUa89ix9QWnyKf
 /Ne7EHPUt1VkQYgB7InE81x3OCpQuy6DGV8phDxNQa0HoL8dPmZ9JrFKz+UORQ6RGffST2o2R
 ee8n7jwxTXo26MgYc3XvOaPMrgKqErCfmv02RnsmVmwzclSctWzYcBgf1uGedXwlkz58GYvoh
 HPY0fJZq6C13Sc0SPaPYWmrzRgTqNTHMcVn2TtYZDzacXuMYlpzTL1Ax69vihKxoJHigDQWAo
 TYyrQQa8RZ6MN27kc
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
Cc: Chen Zhou <chenzhou10@huawei.com>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> NULL check before kfree is unnecessary, so remove it.

Would you like to take similar update suggestions into account?
* 2019-09-04
  KVM: PPC: Book3S HV: Delete an unnecessary check before kfree() in __kvmhv_nested_page_fault()

* [-next] KVM: PPC: Book3S HV: remove redundant NULL check
  https://lkml.kernel.org/lkml/20200401130903.6576-1-chenzhou10@huawei.com/
  https://lore.kernel.org/patchwork/patch/1218800/

Regards,
Markus

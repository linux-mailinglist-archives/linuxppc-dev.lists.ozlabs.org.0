Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE5A83AF83
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jan 2024 18:19:59 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=ucmPOmXi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TKrLP5cxyz3cQT
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jan 2024 04:19:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=ucmPOmXi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=web.de (client-ip=212.227.17.11; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 504 seconds by postgrey-1.37 at boromir; Thu, 25 Jan 2024 04:19:13 AEDT
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TKrKY4byHz3bfS
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Jan 2024 04:19:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1706116742; x=1706721542; i=markus.elfring@web.de;
	bh=eZik0NQgHnxRTjoOGVz1jiYozSbIVj3TpK7roxu/iQA=;
	h=X-UI-Sender-Class:Date:To:Cc:References:Subject:From:
	 In-Reply-To;
	b=ucmPOmXimqTTFngdDo2SZfzKYAUvwgeO3Ncxeu/KNI2+iIljZJ1cjX/qQRsiJju7
	 jj/uFnYLUpTB3w97qf6G1CjD/smz62W7ZIvc6VNmVbqporrrrbRzsH6TWWrBH2M11
	 JCFqhMkvWSfiiFnEYWcbsIrY5WifghQWCZ6jlba7rNeyFrFyaGr9JyRMD01u3HIeS
	 K4EDd1RlLpdp6WEkJD0Qownpy0SrcJmptwIHg+ZFP3M011KdE9s78IoDhDA21KZdF
	 p4/BOdkGen1NAfwnl2Q+imKpzlrF1JUz3caQ3N/VdNPRSP+SY+aFv0QeNfKN0pbvG
	 RypcKGXYQ1Cge+lF+w==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.81.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MrwwJ-1qhJAi0Kl3-00nxrY; Wed, 24
 Jan 2024 18:04:25 +0100
Message-ID: <791da036-5c0d-4c96-b252-24726bc7f2f7@web.de>
Date: Wed, 24 Jan 2024 18:04:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Kunwu Chan <chentao@kylinos.cn>, kvm@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kernel-janitors@vger.kernel.org,
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>
References: <20240124093647.479176-1-chentao@kylinos.cn>
Subject: Re: [PATCH] KVM: PPC: code cleanup for kvmppc_book3s_irqprio_deliver
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240124093647.479176-1-chentao@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:G0go2dhXVu0Sv5YnVpAY+1uRg0zK0HLp5MnOCn5FVZtO4VRVTPf
 k9q/daeBYgsA02NjvmzAn4KOMTlyCurrP5801Mdn4mKysomJU90WRw7ePlw6upIqpTkv7NZ
 hx/J7+hpeY2aNw8FtxcAp9ZkhAB5CRqbr5+4a8zmkttepfuC0gyOPkIB8mqwSrMnlOyi3gS
 ZF2+m+O5P1khKJKI0Qlvg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:4OjEVhcVk6k=;okeH1ndEwonacKk/5t5xyr8P7eP
 tx6gEs2O/A68R066M+zFHai4Xfz4N02eNPiEpppXOidhCqjnZgMnsW4xAIPGxp7kRs0Y+8cFR
 RwYffE7gZFTy3de8e9CjNKUrz9Gh2Jxbv4C2BPIoaFxeaotN3H122DuYtVYT1fhOm9+yC3OU3
 /tB/C6xC09MiWXM5Kd0RtmGfbPkb22aQH+z/0vEDqzkuHNAmKnotbYnStOgmuI4kua6sqz0QW
 aRm+cA9ODBcTS20BRlPhIRIPYcp0QAjgjiHY5hUYlV53s7//Mk0zjVfN1OtJFB5cD1DEv9VqQ
 sva/AgnwqYKn3DdKEwyM5TRhg37TjNtTYPJRMenmq2DwAhT8c4g2UYfV/ff/rGrowLJkbmK+R
 m4rFFVYA8mlX2IOPvuCK0AkdseDykN0cGV75OnCrVSluZsZgEsqTJgFPtY/NGMjcm+wFLii8W
 sSoo7585nRhlXuVu9LWpOBHKVQVuDMLArwMOrUgxCOJ9+9ld80D1hWplmU0zy9QQ5LbjlHhX9
 DJepMzuzg2LeBjaqIqS+eO5qVjCMddvPpLLX5zwL9BpkoAIJcOFIMuj/+LIVuQKEQEH/BL9eU
 Eb+rlD/DlFxXt8sN+2cYokS6xifVDOMNPdr40VmLFQKBscSNc2TiLdmqJU7dmbAJE2UwbOu57
 A28VK26bYZgWxh1QrAP9IyB7HLOpgogvsYCDIY+xNMEERvhTqxoa+B6azZGrJkExJPo4yK//B
 7NdWTuYVdnLVd49DzkZhL7i+zIXh+jhKJLN8ppmLvZZamoxhAghhhw6NXU6sDcJo8FzRT1rLe
 Ry2BzM6fP5IBbeAEXSJHHCioVfKIHp7/HMaJiebBUvDTz6O8Gp7qpxuoa46xYGG5/94qocR+m
 ikHuOuUTrSeMu9rHIVzW+/GkW06R4+JSFvw5wrCP+niWrw2ji/atEYcsX/HCKA7mBSDdVSIRA
 L5Hhgw==
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
Cc: LKML <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> If there are no plans to enable this part code in the future,

Will the word combination =E2=80=9Ccode part=E2=80=9D become preferred for
a subsequent change description?


> we can remove this dead code.

And omit another blank line accordingly?

Regards,
Markus

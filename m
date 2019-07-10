Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2830464282
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jul 2019 09:21:48 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45k9br1lnJzDqfX
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jul 2019 17:21:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=web.de
 (client-ip=212.227.17.12; helo=mout.web.de;
 envelope-from=markus.elfring@web.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=web.de
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=web.de header.i=@web.de header.b="RiPUu7Ii"; 
 dkim-atps=neutral
Received: from mout.web.de (mout.web.de [212.227.17.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45k9Z574WqzDqZF
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jul 2019 17:20:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1562743163;
 bh=h5OkycrU5plWknw63C5d7xmKYmZSpCR9aUVQMfr8lSM=;
 h=X-UI-Sender-Class:Cc:References:Subject:To:From:Date:In-Reply-To;
 b=RiPUu7IijBml8y0P8fSOFZGvmgVjS3dJ1s72pwCUqxEuOaY0c3ommk3/DHDTQvsrH
 yVfbtt3T7L3tgmszrIUrMxF8mTn4HFYq6qqnF/WfIBObEyRieuW7+7vELsVA4VIGrH
 /1XI+mx37klY5DmdTghxuiht6owlTuHdPr46J2fE=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.132.42.76]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0Lr2Zb-1iOpTs0Hx5-00eZvv; Wed, 10
 Jul 2019 09:19:23 +0200
References: <1562670768-23178-2-git-send-email-wen.yang99@zte.com.cn>
Subject: Re: [1/2] powerpc/83xx: fix use-after-free in mpc831x_usb_cfg()
To: Wen Yang <wen.yang99@zte.com.cn>, linuxppc-dev@lists.ozlabs.org
From: Markus Elfring <Markus.Elfring@web.de>
Openpgp: preference=signencrypt
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <3138c2fa-1e99-f672-2108-33dd1cf25ca2@web.de>
Date: Wed, 10 Jul 2019 09:19:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <1562670768-23178-2-git-send-email-wen.yang99@zte.com.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Provags-ID: V03:K1:WOL4ndwtR55k7/yyYs0ws1jNPe9T0eilcyr9y7SFiQlZv+hdwVj
 dph1524PokCJAnCbLMDs1ddKjchhyFq8BsH1QTPdm9SLI4ofVtOOrFuImrcHNAh3+3y9bDF
 La+AISI7OTq2qWO/mKsuDB1ebUffuJMGRJ8VoitxnDemCPLuA+22lskQRU7lh25Gfe1Bbcw
 nPbVc3stuA9nerCcTqBTw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:NJvKKKwoGo0=:+R9cBfGMqIz/JCq3XDbWdX
 /zGbRV03AEPb8kscgMUAUnd0VW3Ziy0juKyq0UPmHE2MHlgo6ZBz6xke6byMd9RxHRxpZ13uJ
 1Q6bsxPWUZ6f85EhVYsTMFnhywBm4mNZ78CnA2Wz6gh8+IfQE/MdbkI0XzPCltP8IclFDGEMj
 IW1xBvPJR+G+/bN98X0jMzL6E+tH2JuBi615tMD51RCWqMHUThjBGg3ug++/JtIW10Oyd0v71
 CLhWchlB4cdx1uYMx7/WKyQzCm7xvoUxspxXo7QxMf8C7Szs5x13LaMn6WeZM8nx+NbiSEDKh
 v1ZkzOEVHr5FbVWzcJknPc7Fi/Kg/PJr1FPzvp3b9T9g+hvLDmGT0z94hFt384Almh6U5PrkW
 Ci1t+LPPjWZKq5aUqqpYUdzx2BMqCnX2XlU6CwkdfdbCkIfljMsN5mbzq8sayBHWhdaNdAjPp
 2pkmzGO/JmFy0qNCVpFVnzpL3o0SROqL+3lATiKamb/DVOsJsNHffBOgJ0AwDDVxBBPMubvQv
 bq2IbcrxpkGLzRdDM2hGHSLGBy5w9LIchsY99fKyDbq5VbcTPUCCWpUe9P/3xD1OE31ucS67o
 49DIXhtC44mL7PjJeco5dX+/Q136Jju0ppOHQKu7Aj1QxXYwCKy/oV6nEP2Xug/Q6L/KZr/SG
 n7yIayzT74I16HEJDTmpnbtU65aMuKe/oNBUYZC4w7uC0LrFEhyzKam7p5q71qmmXhaaqQxUY
 SPDtOX5x60p39edzBSyLN/+vqb2i3xD/heg9lFmwkMBxI8tFV1Cufd0iKld5mgIFGtZiGqQEZ
 1l15jBrBpyrIqcSrMRgKVlYhtK0GP/DpjQu7VDwhiJ0rdWWLz7RbqVUyfA8v3N04/2UDqJp6b
 +NQtLw4pzqz9Mnn67XaVQiOHCq5LqpR3oWIJ22yED2wFmt524bkQq/DzocOUoIq3tQYPeJFEi
 l4B96snDAZeN1p/1ic4P4aTM95ONU1rJBAJ/xWjWokD8LRcUfff9ewYUu+r1JufOWUaas4sJ2
 JY9b3fvcr4JnQE8kqylxd21Vxhxgkc429qiwTP8ZhSS78i0V8PKjuK06cqOwLTsOS3REQqVhx
 MLAXqjiu/USARvx1GxrYbrWmoyxZvNHtjhj
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
 Scott Wood <oss@buserror.net>, Markus.Elfring@web.de,
 Xue Zhihong <xue.zhihong@zte.com.cn>, Paul Mackerras <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> The immr_node variable is still being used after the of_node_put() call,
> which may result in use-after-free.

Was any known source code analysis tool involved to point such
a questionable implementation detail out for further software
development considerations?

Regards,
Markus

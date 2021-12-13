Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C3F471F54
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Dec 2021 03:29:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JC5744R49z3069
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Dec 2021 13:29:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=foxmail.com header.i=@foxmail.com header.a=rsa-sha256 header.s=s201512 header.b=OarK1TFf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=foxmail.com (client-ip=203.205.251.27;
 helo=out203-205-251-27.mail.qq.com; envelope-from=xkernel.wang@foxmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=foxmail.com header.i=@foxmail.com header.a=rsa-sha256
 header.s=s201512 header.b=OarK1TFf; dkim-atps=neutral
X-Greylist: delayed 52033 seconds by postgrey-1.36 at boromir;
 Mon, 13 Dec 2021 13:28:40 AEDT
Received: from out203-205-251-27.mail.qq.com (out203-205-251-27.mail.qq.com
 [203.205.251.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JC56J6Y8Tz2x9N
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Dec 2021 13:28:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
 s=s201512; t=1639362497;
 bh=dJKtjTSKz62rNy49syVpqD28WJWax6LS+Mw42ExvDiE=;
 h=Date:From:To:Cc:Subject;
 b=OarK1TFfplfbv/lwm3EjdNCQoi0rAi9wc0XExlEaqUE9lG6NTAgoHN2XkUoZ3JHHB
 GWl+OM1WxLifKH08dKTgiVEg/mZ/0BoK49NJ/IQHo19kNZLsHttmJKOTmzIj3hLtWF
 e4KQ9/bhxzxWrRPfkLLd3ZdwAf1d7L0iwwkpO58s=
Received: from LAPTOP-4BSPBRI7 ([59.172.176.92])
 by newxmesmtplogicsvrsza7.qq.com (NewEsmtp) with SMTP
 id 6A90BE4C; Mon, 13 Dec 2021 10:26:41 +0800
X-QQ-mid: xmsmtpt1639362401t6u5s3bdr
Message-ID: <tencent_C982943047E43271285358863729A5FF630A@qq.com>
X-QQ-XMAILINFO: M1xqn9pGP6LN76WbLmg5E+5W3cSr5Q2BaM6+cpZekx2T5StSOh/kW47VGafMPZ
 0nVODas39U+GjjKp1zZEzdK2GGnE7fBhyy2sCHnk2lIjgHTdl663jtqa4hJxN19dZozX61y0Ksdi
 JbqUUEtVMjg0vf0UWYC97ldrThhooIAUTCc/VyBr3/AIb6IfWObbX3iOMeLJ+v9LNSm6HY9sRUia
 34LRPoAq271C3M26VP5gWFzGWkH2rt5j970znP3IF5RH/wxAgSlwRD8cU/na7xRl622cjhWOE0+J
 IZX3fUIbMFtHzgGUv30lJ9vqKTp94Mib+z2NbKsOq3lnwI0pAgwEEYUaYkop90f/fIvQz6c17p6m
 8rcdn7fcjpoWArb7Bn3steomCXJoEleNwYro3IJsxQXTOYRWfobdoOILGKNhST1Tx5yyfCV2KI6U
 Z6Ypm3CtEXZ09JbS0x5rnq3LB5QaBgdWUuX4/Y7gcQzB19y+vriMP+fK0eU7Swzc4Ur8Ql+ATwck
 3OuNK972mKzeWPKvzK1qfxEJdlI61CDlQtypeo0dj+RsrIlXSzUSg1XN7gtQBk0cFPaeKTEztpWX
 gRlTTsOPCCXNSIdQ4T1sJ/JhWImNk5WPeVUnuUy7t61Jcf/+m5r7L1/8OTlolJ8JjbCzo2GEDHi/
 OizURGyvLWNfKD0mZ8H+4LHG8bluv6abpL9OjeEF3KyUJU8TYYggluHqRKF2b+fvqhvz6QYqK2Pk
 J/qw8o5lf/wkZ9nmdQgZj47G6X7LHFjIu7xVYYy6DTKrJlTxflYF7ILsh9gttU7PNbaxH36KoFaJ
 +EqD8CPP2UASVpFuA2x/ccvdlEkH4GmDobT65D8xZsXzxA1N3+Qoaax2dG2e4kYHs=
Date: Mon, 13 Dec 2021 10:26:41 +0800
From: "xkernel.wang@foxmail.com" <xkernel.wang@foxmail.com>
To: mpe <mpe@ellerman.id.au>, 
	agust <agust@denx.de>
Subject: Re: [PATCH] powerpc: mpc52xx_gpt: fix a potential memory leak
X-Priority: 3
X-GUID: 0E828642-9115-4B73-A131-B82288F17D29
X-Has-Attach: no
X-Mailer: Foxmail 7.2.14.410[en]
Mime-Version: 1.0
Message-ID: <202112131026410462899@foxmail.com>
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64
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
Cc: paulus <paulus@samba.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

TWljaGFlbCBFbGxlcm1hbiA8bXBlQGVsbGVybWFuLmlkLmF1PiB3cm90ZToKPiA+IFdoZW4gc29t
ZSBpbnRlcm5hbCBtZW1vcnkgZXJyb3JzIGhhcHBlbmQgaW4gb2ZfaW9tYXAoKSwgd2Ugc2hvdWxk
IGZyZWUKPiA+IGdwdCB0byBwcmV2ZW50IG1lbW9yeSBsZWFrLgo+Cj4gQnV0IGl0J3MgYWxsb2Nh
dGVkIHdpdGggZGV2bV9remFsbG9jKCksIHNvIHRoZSBkZXZyZXMgY29yZSBpcyBtZWFudCB0bwo+
IGZyZWUgaXQgZm9yIHVzIGlzbid0IGl0PwoKWWVzLCBtYXliZSB5b3UgYXJlIHJpZ2h0LiBJIGRp
ZCB0aGF0IGFzIEkgbWVudGlvbmVkIHdoZW4gZ3B0LXJlZ3MgaXMgTlVMTCwgaXTCoAp3aWxsIHJl
dHVybiAtRU5PTUVNLCB3aGljaCBpcyB0aGUgc2FtZSB3aGVuIGdwdCBpcyBOVUxMLiBTbyBJIHN1
cHBvc2UgdG8gCmZyZWXCoGl0IGluIHRpbWUgaXMgYmV0dGVyOgo+CWdwdCA9IGRldm1fa3phbGxv
Yygmb2ZkZXYtPmRldiwgc2l6ZW9mICpncHQsIEdGUF9LRVJORUwpOwo+CWlmICghZ3B0KQo+CQly
ZXR1cm4gLUVOT01FTTsKCmNoZWVycwoK

.


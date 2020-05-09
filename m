Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 167231CBF6C
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 May 2020 10:53:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49K1Fj35JhzDr2N
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 May 2020 18:53:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49K13b0F14zDr6t
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 May 2020 18:44:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=QbBZzPes; dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 49K13W4XYvz9sSw; Sat,  9 May 2020 18:44:55 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49K13W1YjRz9sSg;
 Sat,  9 May 2020 18:44:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1589013895; bh=wCVz6E98gfC11WCYOvmklOq2R7vgnbwac4O/W67xLKA=;
 h=Date:Subject:In-Reply-To:From:To:Cc:From;
 b=QbBZzPesvu2iK+QOp/193v+7D5dg3TmJTXHzrIXnAhuAHExFQZ1Zy0n3DAlScdfot
 mq0gjuSe/c39/9xTGaJ3/MO60XXVKNRM9Cic5ofHR05BuDNJjseYOX+894LzCerGSo
 JE1mB7T/tvzCd0RX/b6+M8W4kD/vXERSLWJvQKATwfQYUNLkp/YN/65c+g5FJkGgJF
 4uMp/L046qCLRoonjR95XR9JtTY1tE2UyaoIWvN4RUoqARQKGHI7yC5WK01XpQneuS
 K4x7fmYwF/SWMWR535o+v+MrL5XfBGvrshJ3bYWR+ADkUFoFov8vebfvBY+OmfUz8f
 9TvocXC4cYzWw==
Date: Sat, 09 May 2020 18:44:53 +1000
Subject: Re: [PATCH RFC 2/4] powerpc: Add Microwatt platform
Message-ID: <10f5eac8-63cd-4fa2-b737-77bf277d6f1f@email.android.com>
X-Android-Message-ID: <10f5eac8-63cd-4fa2-b737-77bf277d6f1f@email.android.com>
In-Reply-To: <2771261.oJVn4HZnso@townsend>
From: benh@ozlabs.org
To: Alistair Popple <alistair@popple.id.au>
Importance: Normal
X-Priority: 3
X-MSMail-Priority: Normal
MIME-Version: 1.0
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: base64
X-Mailman-Approved-At: Sat, 09 May 2020 18:50:30 +1000
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
Cc: Michael Neuling <mikey@neuling.org>, Nicholas Piggin <npiggin@gmail.com>,
 linuxppc-dev@ozlabs.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

PGRpdiBkaXI9J2F1dG8nPldlIHNob3VsZCBkbyB0aGF0IGhlcmUgdG9vLiBUaW1lIHRvIHJlcGxh
Y2Ugb3VyIHNpbGx5IFVBUlQgITwvZGl2PjxkaXYgY2xhc3M9ImdtYWlsX2V4dHJhIj48YnI+PGRp
diBjbGFzcz0iZ21haWxfcXVvdGUiPk9uIDkgTWF5IDIwMjAgNjozNiBwbSwgQWxpc3RhaXIgUG9w
cGxlICZsdDthbGlzdGFpckBwb3BwbGUuaWQuYXUmZ3Q7IHdyb3RlOjxiciB0eXBlPSJhdHRyaWJ1
dGlvbiIgLz48YmxvY2txdW90ZSBjbGFzcz0icXVvdGUiIHN0eWxlPSJtYXJnaW46MCAwIDAgLjhl
eDtib3JkZXItbGVmdDoxcHggI2NjYyBzb2xpZDtwYWRkaW5nLWxlZnQ6MWV4Ij48cCBkaXI9Imx0
ciI+T24gU2F0dXJkYXksIDkgTWF5IDIwMjAgNTo1ODo1NyBQTSBBRVNUIE5pY2hvbGFzIFBpZ2dp
biB3cm90ZTomIzEzOzxicj4KJmd0OyBFeGNlcnB0cyBmcm9tIFBhdWwgTWFja2VycmFzJ3MgbWVz
c2FnZSBvZiBNYXkgOSwgMjAyMCAzOjAyIHBtOiYjMTM7PGJyPgomZ3Q7ICZndDsgTWljcm93YXR0
IGlzIGEgRlBHQS1iYXNlZCBpbXBsZW1lbnRhdGlvbiBvZiB0aGUgUG93ZXIgSVNBLiZuYnNwOyBJ
dCYjMTM7PGJyPgomZ3Q7ICZndDsgY3VycmVudGx5IG9ubHkgaW1wbGVtZW50cyBsaXR0bGUtZW5k
aWFuIDY0LWJpdCBtb2RlLCBhbmQgZG9lcyYjMTM7PGJyPgomZ3Q7ICZndDsgbm90ICh5ZXQpIHN1
cHBvcnQgU01QLiYjMTM7PGJyPgomZ3Q7ICZndDsgJiMxMzs8YnI+CiZndDsgJmd0OyBUaGlzIGFk
ZHMgYSBuZXcgbWFjaGluZSB0eXBlIHRvIHN1cHBvcnQgRlBHQS1iYXNlZCBTb0NzIHdpdGggYSYj
MTM7PGJyPgomZ3Q7ICZndDsgTWljcm93YXR0IGNvcmUuJiMxMzs8YnI+CiZndDsgJiMxMzs8YnI+
CiZndDsgVmVyeSBjb29sISYjMTM7PGJyPgomZ3Q7ICYjMTM7PGJyPgomZ3Q7IFdvdWxkIHRoZXJl
IGJlIGFueSBwb2ludCBzaGFyaW5nIHRoaXMgd2l0aCB0aGUgIm5ha2VkIG1ldGFsIiBwbGF0Zm9y
bSYjMTM7PGJyPgomZ3Q7IEFsaXN0YWlyIGhhcyBmb3IgYm9vdGluZyBQT1dFUiBpbiBMMyB3aXRo
b3V0IE9QQUw/IE9yIGlzIGl0IGVhc3kgZW5vdWdoJiMxMzs8YnI+CiZndDsgdG8gaGF2ZSBhIHNl
dmVyYWwgZGlmZmVyZW50IHNpbXBsZSA2NHMgcGxhdGZvcm1zPyYjMTM7PGJyPgomIzEzOzxicj4K
SXQgbG9va3MgcHJldHR5IHNpbWlsYXIgYXQgdGhlIG1vbWVudCwgSSd2ZSBiZWVuIG1lYW5pbmcg
dG8gY2xlYW4gdGhvc2UgJiMxMzs8YnI+CnBhdGNoZXMgdXAgYW5kIHNlbmQgdGhlbSB1cHN0cmVh
bSBidXQgUGF1bCBoYXMgYmVhdGVuIG1lIHRvIGl0LiBUaGUgbWFpbiAmIzEzOzxicj4KZGlmZmVy
ZW5jZSBzbyBmYXIgaXMgaG93IHRoZSBjb25zb2xlIGlzIHNldHVwLiBGb3IgYm9vdGluZyBjYWNo
ZSBjb250YWluZWQgSSAmIzEzOzxicj4Kd2FzIHVzaW5nIGEgZGV2aWNlIHRyZWUgcG9pbnRpbmcg
YXQgYSBzdGFuZGFyZCBVQVJUIGRyaXZlciBhbmQgZW5hYmxpbmcgdGhlICYjMTM7PGJyPgpzdGFu
ZGFyZCBPRiBwbGF0Zm9ybSBkZXZpY2UgdHJlZSBwcm9iaW5nLiYjMTM7PGJyPgomIzEzOzxicj4K
LSBBbGlzdGFpciYjMTM7PGJyPgomIzEzOzxicj4KJmd0OyBJIGhhdmUgYW4gSFBUIGNvbmRpdGlv
bmFsIGNvbXBpbGUgcGF0Y2ggYW5kIGEgZmV3IG90aGVyIGRpZXQgS2NvbmZpZyYjMTM7PGJyPgom
Z3Q7IHRoaW5ncyBJJ2xsIG5vdyBiZSBiZXR0ZXIganVzdGlmaWVkIHRvIHRyeSBnZXQgbWVyZ2Vk
IDopJiMxMzs8YnI+CiZndDsgJiMxMzs8YnI+CiZndDsgVGhhbmtzLCYjMTM7PGJyPgomZ3Q7IE5p
Y2smIzEzOzxicj4KJiMxMzs8YnI+CiYjMTM7PGJyPgomIzEzOzxicj4KJiMxMzs8YnI+CjwvcD4K
PC9ibG9ja3F1b3RlPjwvZGl2Pjxicj48L2Rpdj4=


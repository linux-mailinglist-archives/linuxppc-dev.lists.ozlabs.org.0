Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 505A4563BD1
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Jul 2022 23:37:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LZT801ZQxz3dsY
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Jul 2022 07:37:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=PhETJKRZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=126.com (client-ip=220.181.15.50; helo=m1550.mail.126.com; envelope-from=windhl@126.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=PhETJKRZ;
	dkim-atps=neutral
Received: from m1550.mail.126.com (m1550.mail.126.com [220.181.15.50])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LZT7K4SFFz3cgc
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Jul 2022 07:37:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=KVwcY
	n70yPecgm4x4XTKyRe6bSXgdCansfMlHWkNAjs=; b=PhETJKRZ0L5NUlZRobLBc
	Hk+uefsvDJdoRumG1XoMp5Qtk80tcvrpbOlGPYEmWS6HhYo1WmnO37efPMixV1/+
	n0b6R5HWZXw9/BPBxQ115PkM6EJN9PKBukEOAWj0o/g9TYbCoxaXOxKb6LHdp0tM
	LHJVSJOoS7lDYz62qpK6Ro=
Received: from windhl$126.com ( [123.112.71.157] ) by ajax-webmail-wmsvr50
 (Coremail) ; Sat, 2 Jul 2022 05:36:50 +0800 (CST)
X-Originating-IP: [123.112.71.157]
Date: Sat, 2 Jul 2022 05:36:50 +0800 (CST)
From: "Liang He" <windhl@126.com>
To: "Tyrel Datwyler" <tyreld@linux.ibm.com>
Subject: Re:Re: [PATCH] powerpc: kernel: pci_dn: Add missing of_node_put()
 for of_get_xx API
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20220113(9671e152)
 Copyright (c) 2002-2022 www.mailtech.cn 126com
In-Reply-To: <09bcb7d7-5c27-04cc-6796-cbeb3d0abb14@linux.ibm.com>
References: <20220701131750.240170-1-windhl@126.com>
 <09bcb7d7-5c27-04cc-6796-cbeb3d0abb14@linux.ibm.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
MIME-Version: 1.0
Message-ID: <45bdd1ef.cf.181bbb1f1e9.Coremail.windhl@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: MsqowADXLPHzaL9is8BBAA--.35257W
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbi3BMxF1pED15m1wAAsX
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
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
Cc: linmq006@gmail.com, paulus@samba.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

CkF0IDIwMjItMDctMDIgMDM6NDc6MjIsICJUeXJlbCBEYXR3eWxlciIgPHR5cmVsZEBsaW51eC5p
Ym0uY29tPiB3cm90ZToKPk9uIDcvMS8yMiAwNjoxNywgTGlhbmcgSGUgd3JvdGU6Cj4+IEluIHBj
aV9hZGRfZGV2aWNlX25vZGVfaW5mbygpLCB3ZSBzaG91bGQgdXNlIG9mX25vZGVfcHV0KCkgZm9y
IHRoZQo+PiByZWZlcmVuY2UgJ3BhcmVudCcgcmV0dXJuZWQgYnkgb2ZfZ2V0X3BhcmVudCgpIHRv
IGtlZXAgcmVmY291bnQKPj4gYmFsYW5jZS4KPj4gCj4+IEZpeGVzOiBjY2E4N2QzMDNjODUgKCJw
b3dlcnBjL3BjaTogUmVmYWN0b3IgcGNpX2RuIikKPj4gQ28tYXV0aG9yZWQtYnk6IE1pYW9xaWFu
IExpbiA8bGlubXEwMDZAZ21haWwuY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBMaWFuZyBIZSA8d2lu
ZGhsQDEyNi5jb20+Cj4+IC0tLQo+PiAgYXJjaC9wb3dlcnBjL2tlcm5lbC9wY2lfZG4uYyB8IDEg
Kwo+PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4+IAo+PiBkaWZmIC0tZ2l0IGEv
YXJjaC9wb3dlcnBjL2tlcm5lbC9wY2lfZG4uYyBiL2FyY2gvcG93ZXJwYy9rZXJuZWwvcGNpX2Ru
LmMKPj4gaW5kZXggOTM4YWI4ODM4YWI1Li5hYTIyMTk1ODAwN2UgMTAwNjQ0Cj4+IC0tLSBhL2Fy
Y2gvcG93ZXJwYy9rZXJuZWwvcGNpX2RuLmMKPj4gKysrIGIvYXJjaC9wb3dlcnBjL2tlcm5lbC9w
Y2lfZG4uYwo+PiBAQCAtMzMwLDYgKzMzMCw3IEBAIHN0cnVjdCBwY2lfZG4gKnBjaV9hZGRfZGV2
aWNlX25vZGVfaW5mbyhzdHJ1Y3QgcGNpX2NvbnRyb2xsZXIgKmhvc2UsCj4+ICAJSU5JVF9MSVNU
X0hFQUQoJnBkbi0+bGlzdCk7Cj4+ICAJcGFyZW50ID0gb2ZfZ2V0X3BhcmVudChkbik7Cj4+ICAJ
cGRuLT5wYXJlbnQgPSBwYXJlbnQgPyBQQ0lfRE4ocGFyZW50KSA6IE5VTEw7Cj5OQUNLCj4KPnBk
bi0+cGFyZW50IGlzIG5vdyBhIGxvbmcgdGVybSByZWZlcmVuY2Ugc28gd2Ugc2hvdWxkIG5vdCBk
byBhIHB1dCBvbiBwYXJlbnQKPnVudGlsIHdlIHBkbi0+cGFyZW50IGlzIG5vIGxvbmdlciB2YWxp
ZC4KPgo+LVR5cmVsCgpIaSwgVHlyZWwKClRoYW5rcyBmb3IgcmV2aWV3aW5nIHRoaXMgY29kZS4K
CkJ1dCBJIHRoaW5rIHRoZXJlIGlzIHNvbWUgY29uZnVzaW9uIGFib3V0IHRoZSBvZl9nZXRfcGFy
ZW50KCkgYW5kIEkgY2FuIGNvbmZpcm0KbXkgcG9pbnQgd2hlbiBJIGNoZWNrIHRoZSAncGNpX3Jl
bW92ZV9kZXZpY2Vfbm9kZV9pbmZvJyBmdW5jdGlvbiwgd2hpY2ggbWF5IGJlCmEgc2Vjb25kIGJ1
Zy4KCkluIHBjaV9yZW1vdmVfZGV2aWNlX25vZGVfaW5mbygpLCBJIG5vdGljZSB0aGUgY29tbWVu
dCwgJ0Ryb3AgdGhlIHBhcmVudCBwY2lfZG4ncyByZWYgLi4uJy4KSG93ZXZlciwgb2ZfZ2V0X3Bh
cmVudCgpIHdpbGwgaW5jcmVhc2UgdGhlIHJlZmNvdW50IG9mIHRoZSBwYXJlbnQsIGFuZCB0aGVu
IHRoZQpmb2xsb3dpbmcgb2Zfbm9kZV9wdXQoKSB3aWxsIGRlY3JlYXNlIHRoZSByZWZjb3VudCwg
c28sIGZpbmFsbHksIHRoZXJlIGlzIG5vIGFueSBjaGFuZ2UuCgpCYWNrIHRvIHRoaXMgY2FzZSwg
YXMgdGhlICdwZG4tPnBhcmVudCcgaXMgbm90IHRoZSByZWZlcmVuY2Ugb2YgcGFyZW50IGRldmlj
ZV9ub2RlLCBpdCBpcwpkZXZpY2Vfbm9kZSdzIGRhdGEsIHNvIEkgdGhpbmsgaXQgaXMgYmV0dGVy
IHRvIGtlZXAgdGhlIG9yaWdpbmFsIG1lYW5pbmcgb2YgcmVmY291bnRpbmcsIGkuZSwKYWRkIGEg
b2Zfbm9kZV9wdXQoKSB0byBrZWVwIHRoZSByZWZjb3VudCBiYWxhbmNlLgoKSWYgSSBoYXZlIHNv
bWUgbWlzLXVuZGVyc3RhbmRpbmcsIHBsZWFzZSBjb3JyZWN0IG1lLgoKVGhhbmtzLAoKTGlhbmcK
Cj4KPj4gKwlvZl9ub2RlX3B1dChwYXJlbnQpOwo+PiAgCWlmIChwZG4tPnBhcmVudCkKPj4gIAkJ
bGlzdF9hZGRfdGFpbCgmcGRuLT5saXN0LCAmcGRuLT5wYXJlbnQtPmNoaWxkX2xpc3QpOwo+PiAK


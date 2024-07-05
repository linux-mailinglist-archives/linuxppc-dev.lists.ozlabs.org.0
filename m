Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5E49290AB
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Jul 2024 06:18:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=xtra.co.nz header.i=@xtra.co.nz header.a=rsa-sha256 header.s=alpha header.b=lq9yFdPc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WGHFR6nRqz3cVq
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Jul 2024 14:18:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=xtra.co.nz
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=xtra.co.nz header.i=@xtra.co.nz header.a=rsa-sha256 header.s=alpha header.b=lq9yFdPc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=xtra.co.nz (client-ip=210.55.143.48; helo=out2301.xtra.co.nz; envelope-from=rtd2@xtra.co.nz; receiver=lists.ozlabs.org)
X-Greylist: delayed 900 seconds by postgrey-1.37 at boromir; Fri, 05 Jul 2024 23:45:38 AEST
Received: from out2301.xtra.co.nz (out2301.xtra.co.nz [210.55.143.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WFvst5YJ5z3c47
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Jul 2024 23:45:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xtra.co.nz; s=alpha;
	t=1720186236; bh=tpSA//IzsEBnTgkqAV05vROpoXDS+nroWaML+SNgVkE=;
	h=Message-ID:Date:Subject:From:To:Cc;
	b=lq9yFdPccN2QCwYBbgpBswpCdrUx6TMAtj3kN6x/R7tvXE35aDAERt+yZCbZl5o0S
	 3QNERtDk2pD45tJucCP2TUJI2CusGvsEeSPmslPvcK9KnCrEtOzJZcc9ymxEdvAwoQ
	 kU9o9YIPybp0v8SG1P5R+RGvSe/4tL+xLxO2gqLc=
SMX-Results: classifications=clean;dmarc=none;spf=softfail
SMX-S1C: gggruggvucftvghtrhhoucdtuddrgeeftddrvddugdeigecutefuodetggdotefrodftvfcurfhroh
	hfihhlvgemucfuofginecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdl
	qddutddtmdenucfjughrpefkfffujggkhffvveggtgesrgdtreertddtjeenucfhrhhomhepvfhrvg
	hvohhrucffihgtkhhinhhsohhnuceorhhtugdvseigthhrrgdrtghordhniieqnecuggftrfgrthht
	vghrnhepgfeutdfghfevteduhfelieefheehvdelvddutdelleegteelgeegieehtdffudetnecuff
	homhgrihhnpehkvghrnhgvlhdrohhrghdphhihphgvrhhiohhnqdgvnhhtvghrthgrihhnmhgvnhht
	rdgtohhmnecukfhppeduvddvrdehiedrvddtgedrjedtnecuvehluhhsthgvrhfuihiivgeptdenuc
	frrghrrghmpehinhgvthepuddvvddrheeirddvtdegrdejtddpmhgrihhlfhhrohhmpehrthguvdes
	gihtrhgrrdgtohdrnhiipdhnsggprhgtphhtthhopeduuddprhgtphhtthhopehmrgiisehkvghrnh
	gvlhdrohhrghdprhgtphhtthhopegthhiiihhgohhtiihkhiesgigvnhhoshhofhhtrdguvgdprhgt
	phhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghprghtvghlsehvvghnth
	grnhgrmhhitghrohdrtghomhdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghr
	nhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlh
	drohhrghdprhgtphhtthhopehlihhnuhigphhptgdquggvvheslhhishhtshdrohiilhgrsghsrdho
	rhhg
SMX-S1V: clean
SMX-S1S: -100
Received: from [122.56.204.70] by send.xtra.co.nz with ESMTP (using TLSv1.2
	with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	id 6687F573-1EE309E9@mta2302.omr;
	Fri, 05 Jul 2024 13:30:36 +0000
SavedFromEmail: rtd2@xtra.co.nz
Message-ID: <ED.BC.01902.375F7866@xtra.co.nz>
Date: Fri, 05 Jul 2024 14:30:22 +0100
Subject: =?US-ASCII?Q?Re:_[PowerPC]_[PASEMI]_Issue_with_the_identificatio?=
 =?US-ASCII?Q?n_of_ATA_drives=0D__after_the_of/irq_updates_2024-05-29?=
In-Reply-To: <12665d67dcf74cd9a2cd8388d8106f8d@kernel.org>
Importance: normal
From: Trevor Dickinson <rtd2@xtra.co.nz>
To: Marc Zyngier <maz@kernel.org>, Christian Zigotzky
 <chzigotzky@xenosoft.de>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="--_com.samsung.android.email_2067348414150890"
X-Mailman-Approved-At: Sat, 06 Jul 2024 14:18:17 +1000
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
Cc: apatel@ventanamicro.com, Rob Herring <robh@kernel.org>, Darren Stevens <darren@stevens-zone.net>, DTML <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, mad skateman <madskateman@gmail.com>, Matthew Leaman <matthew@a-eon.biz>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

----_com.samsung.android.email_2067348414150890
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64

SnVzdCBmb3IgaW5mby5DaHJpc3RpYW4gaXMgYSB2ZXJ5IGFjdGl2ZSB0ZXN0ZXIgb2YgdGhlIEtl
cm5lbCBvbiBvdXIgUG93ZXJQQyBoYXJkd2FyZS4gSGVhbHNvIGNvb3JkaW5hdGVzIGEgc21hbGwg
YnV0IGFjdGl2ZSB0ZWFtIG9mIGJldGEgdGVzdGVycyB3aG8gZW5zdXJlIHRoYXQgb3VyIGhhcmR3
YXJlIHN1cHBvcnRzIGEgd2lkZSByYW5nZSBvZiBQb3dlclBDIExpbnV4IGRpc3RyaWJ1dGlvbi5S
ZWdhcmRzLFRyZXZvciBEaWNraW5zb25Dby1mb3VuZGVyIG9mIEEtRU9OIFRlY2hub2xvZ3lTZW50
IGZyb20gbXkgR2FsYXh5Ci0tLS0tLS0tIE9yaWdpbmFsIG1lc3NhZ2UgLS0tLS0tLS1Gcm9tOiBN
YXJjIFp5bmdpZXIgPG1hekBrZXJuZWwub3JnPiBEYXRlOiAwNS8wNy8yMDI0ICAxNDowMSAgKEdN
VCswMDowMCkgVG86IENocmlzdGlhbiBaaWdvdHpreSA8Y2h6aWdvdHpreUB4ZW5vc29mdC5kZT4g
Q2M6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+LCBhcGF0ZWxAdmVudGFuYW1pY3JvLmNv
bSwgRFRNTCA8ZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc+LCBMaW51eCBLZXJuZWwgTWFpbGlu
ZyBMaXN0IDxsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnPiwgbGludXhwcGMtZGV2IDxsaW51
eHBwYy1kZXZAbGlzdHMub3psYWJzLm9yZz4sIG1hZCBza2F0ZW1hbiA8bWFkc2thdGVtYW5AZ21h
aWwuY29tPiwgIlIuVC5EaWNraW5zb24iIDxydGQyQHh0cmEuY28ubno+LCBNYXR0aGV3IExlYW1h
biA8bWF0dGhld0BhLWVvbi5iaXo+LCBEYXJyZW4gU3RldmVucyA8ZGFycmVuQHN0ZXZlbnMtem9u
ZS5uZXQ+LCBDaHJpc3RpYW4gWmlnb3R6a3kgPGluZm9AeGVub3NvZnQuZGU+IFN1YmplY3Q6IFJl
OiBbUG93ZXJQQ10gW1BBU0VNSV0gSXNzdWUgd2l0aCB0aGUgaWRlbnRpZmljYXRpb24gb2YgQVRB
IGRyaXZlcwogIGFmdGVyIHRoZSBvZi9pcnEgdXBkYXRlcyAyMDI0LTA1LTI5IE9uIDIwMjQtMDct
MDUgMDk6MDUsIENocmlzdGlhbiBaaWdvdHpreSB3cm90ZTo+IEhvdyBhYm91dCB0aGUgb3RoZXIg
cGF0Y2hbMV0sIHdoaWNoIHdvdWxkIGJlIGZhciBwcmVmZXJhYmxlPz4gPsKgwqDCoCBNLj4gPiBb
MV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzg2ZWQ4YmEyc3Aud2wtbWF6QGtlcm5lbC5v
cmc+ID4gLSAtIC0gLT4gPiBNYXJjLD4gPiBXZSB3aWxsIHRlc3QgdGhlIHBhdGNoIGFzIHNvb24g
YXMgcG9zc2libGUuPiA+IENocmlzdGlhbj4gPiAtIC0gLSAtPiA+IE91ciB0ZXN0ZXIgaGFzIHJl
cG9ydGVkLCB0aGF0IGl0IGRvZXNu4oCZdCBib290LkRvZXMgaXQgbWVhbiB5b3UgYXJlIG5vdCB0
ZXN0aW5nIHRoaXMgeW91cnNlbGY/Pz8+ID4gTGluazogPiBodHRwczovL2ZvcnVtLmh5cGVyaW9u
LWVudGVydGFpbm1lbnQuY29tL3ZpZXd0b3BpYy5waHA/cD01ODYyNyNwNTg2MjdIb3cgZG9lcyBp
dCBmYWlsPyBJJ3ZlIHJlcGVhdGVkbHkgYXNrZWQgZm9yIGRtZXNnIG91dHB1dHNmb3Igd29ya2lu
ZyBhbmQgbm9uLXdvcmtpbmcgY29uZmlndXJhdGlvbnMuwqDCoMKgwqDCoMKgwqDCoCBNLi0tIEph
enogaXMgbm90IGRlYWQuIEl0IGp1c3Qgc21lbGxzIGZ1bm55Li4u

----_com.samsung.android.email_2067348414150890
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: base64

PGh0bWw+PGhlYWQ+PG1ldGEgaHR0cC1lcXVpdj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0
L2h0bWw7IGNoYXJzZXQ9VVRGLTgiPjwvaGVhZD48Ym9keSBkaXI9ImF1dG8iPjxkaXYgZGlyPSJh
dXRvIj5KdXN0IGZvciBpbmZvLjwvZGl2PjxkaXYgZGlyPSJhdXRvIj48YnI+PC9kaXY+PGRpdiBk
aXI9ImF1dG8iPkNocmlzdGlhbiBpcyBhIHZlcnkgYWN0aXZlIHRlc3RlciBvZiB0aGUgS2VybmVs
IG9uIG91ciBQb3dlclBDIGhhcmR3YXJlLiBIZWFsc28gY29vcmRpbmF0ZXMgYSBzbWFsbCBidXQg
YWN0aXZlIHRlYW0gb2YgYmV0YSB0ZXN0ZXJzIHdobyBlbnN1cmUgdGhhdCBvdXIgaGFyZHdhcmUg
c3VwcG9ydHMgYSB3aWRlIHJhbmdlIG9mIFBvd2VyUEMgTGludXggZGlzdHJpYnV0aW9uLjwvZGl2
PjxkaXYgZGlyPSJhdXRvIj48YnI+PC9kaXY+PGRpdiBkaXI9ImF1dG8iPlJlZ2FyZHMsPC9kaXY+
PGRpdiBkaXI9ImF1dG8iPjxicj48L2Rpdj48ZGl2IGRpcj0iYXV0byI+VHJldm9yIERpY2tpbnNv
bjwvZGl2PjxkaXYgZGlyPSJhdXRvIj5Dby1mb3VuZGVyIG9mIEEtRU9OIFRlY2hub2xvZ3k8L2Rp
dj48ZGl2IGRpcj0iYXV0byI+PGJyPjwvZGl2PjxkaXYgZGlyPSJhdXRvIj48YnI+PC9kaXY+PGRp
diBkaXI9ImF1dG8iPjxicj48L2Rpdj48ZGl2IGRpcj0iYXV0byI+PGJyPjwvZGl2PjxkaXYgZGly
PSJhdXRvIj48YnI+PC9kaXY+PGRpdiBpZD0iY29tcG9zZXJfc2lnbmF0dXJlIiBkaXI9ImF1dG8i
PjxkaXYgc3R5bGU9ImZvbnQtc2l6ZToxMnB4O2NvbG9yOiM1NzU3NTciIGRpcj0iYXV0byI+U2Vu
dCBmcm9tIG15IEdhbGF4eTwvZGl2PjwvZGl2PjxkaXYgZGlyPSJhdXRvIj48YnI+PC9kaXY+PGRp
dj48YnI+PC9kaXY+PGRpdiBhbGlnbj0ibGVmdCIgZGlyPSJhdXRvIiBzdHlsZT0iZm9udC1zaXpl
OjEwMCU7Y29sb3I6IzAwMDAwMCI+PGRpdj4tLS0tLS0tLSBPcmlnaW5hbCBtZXNzYWdlIC0tLS0t
LS0tPC9kaXY+PGRpdj5Gcm9tOiBNYXJjIFp5bmdpZXIgJmx0O21hekBrZXJuZWwub3JnJmd0OyA8
L2Rpdj48ZGl2PkRhdGU6IDA1LzA3LzIwMjQgIDE0OjAxICAoR01UKzAwOjAwKSA8L2Rpdj48ZGl2
PlRvOiBDaHJpc3RpYW4gWmlnb3R6a3kgJmx0O2Noemlnb3R6a3lAeGVub3NvZnQuZGUmZ3Q7IDwv
ZGl2PjxkaXY+Q2M6IFJvYiBIZXJyaW5nICZsdDtyb2JoQGtlcm5lbC5vcmcmZ3Q7LCBhcGF0ZWxA
dmVudGFuYW1pY3JvLmNvbSwgRFRNTCAmbHQ7ZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmcmZ3Q7
LCBMaW51eCBLZXJuZWwgTWFpbGluZyBMaXN0ICZsdDtsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwu
b3JnJmd0OywgbGludXhwcGMtZGV2ICZsdDtsaW51eHBwYy1kZXZAbGlzdHMub3psYWJzLm9yZyZn
dDssIG1hZCBza2F0ZW1hbiAmbHQ7bWFkc2thdGVtYW5AZ21haWwuY29tJmd0OywgIlIuVC5EaWNr
aW5zb24iICZsdDtydGQyQHh0cmEuY28ubnomZ3Q7LCBNYXR0aGV3IExlYW1hbiAmbHQ7bWF0dGhl
d0BhLWVvbi5iaXomZ3Q7LCBEYXJyZW4gU3RldmVucyAmbHQ7ZGFycmVuQHN0ZXZlbnMtem9uZS5u
ZXQmZ3Q7LCBDaHJpc3RpYW4gWmlnb3R6a3kgJmx0O2luZm9AeGVub3NvZnQuZGUmZ3Q7IDwvZGl2
PjxkaXY+U3ViamVjdDogUmU6IFtQb3dlclBDXSBbUEFTRU1JXSBJc3N1ZSB3aXRoIHRoZSBpZGVu
dGlmaWNhdGlvbiBvZiBBVEEgZHJpdmVzCiAgYWZ0ZXIgdGhlIG9mL2lycSB1cGRhdGVzIDIwMjQt
MDUtMjkgPC9kaXY+PGRpdj48YnI+PC9kaXY+PC9kaXY+T24gMjAyNC0wNy0wNSAwOTowNSwgQ2hy
aXN0aWFuIFppZ290emt5IHdyb3RlOjxicj4mZ3Q7IEhvdyBhYm91dCB0aGUgb3RoZXIgcGF0Y2hb
MV0sIHdoaWNoIHdvdWxkIGJlIGZhciBwcmVmZXJhYmxlPzxicj4mZ3Q7IDxicj4mZ3Q7Jm5ic3A7
Jm5ic3A7Jm5ic3A7IE0uPGJyPiZndDsgPGJyPiZndDsgWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2FsbC84NmVkOGJhMnNwLndsLW1hekBrZXJuZWwub3JnPGJyPiZndDsgPGJyPiZndDsgLSAt
IC0gLTxicj4mZ3Q7IDxicj4mZ3Q7IE1hcmMsPGJyPiZndDsgPGJyPiZndDsgV2Ugd2lsbCB0ZXN0
IHRoZSBwYXRjaCBhcyBzb29uIGFzIHBvc3NpYmxlLjxicj4mZ3Q7IDxicj4mZ3Q7IENocmlzdGlh
bjxicj4mZ3Q7IDxicj4mZ3Q7IC0gLSAtIC08YnI+Jmd0OyA8YnI+Jmd0OyBPdXIgdGVzdGVyIGhh
cyByZXBvcnRlZCwgdGhhdCBpdCBkb2VzbuKAmXQgYm9vdC48YnI+PGJyPkRvZXMgaXQgbWVhbiB5
b3UgYXJlIG5vdCB0ZXN0aW5nIHRoaXMgeW91cnNlbGY/Pz88YnI+PGJyPiZndDsgPGJyPiZndDsg
TGluazogPGJyPiZndDsgaHR0cHM6Ly9mb3J1bS5oeXBlcmlvbi1lbnRlcnRhaW5tZW50LmNvbS92
aWV3dG9waWMucGhwP3A9NTg2MjcjcDU4NjI3PGJyPjxicj5Ib3cgZG9lcyBpdCBmYWlsPyBJJ3Zl
IHJlcGVhdGVkbHkgYXNrZWQgZm9yIGRtZXNnIG91dHB1dHM8YnI+Zm9yIHdvcmtpbmcgYW5kIG5v
bi13b3JraW5nIGNvbmZpZ3VyYXRpb25zLjxicj48YnI+Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IE0uPGJyPi0tIDxicj5KYXp6IGlzIG5vdCBkZWFkLiBJ
dCBqdXN0IHNtZWxscyBmdW5ueS4uLjxicj48L2JvZHk+PC9odG1sPg==

----_com.samsung.android.email_2067348414150890--


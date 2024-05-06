Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B9EAD8BD3F1
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 May 2024 19:40:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=k0Mxp0Bf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VY7ws2Jd4z3cTD
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2024 03:40:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=k0Mxp0Bf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=masahiroy@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VY7w66Yzcz30Wf
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 May 2024 03:40:06 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E714C613E2
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 May 2024 17:40:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A32EC116B1
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 May 2024 17:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715017204;
	bh=it9XXZpJTkYh0G8Z83jG4K85j3scu02x9dFoHWqJIxQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=k0Mxp0BfaOjIkwqGb6GMjHQRIm24MHqWAVrh01toAYWVEZISYNODhVXij4Z4Jpy8t
	 YrZvLqYV0b8sapdpn2Rxxr/mtuhlgMR9DRsq7UrC3WcGX6cyQ3nlucBeCI6PNEP1xb
	 c8X6qhWjNZmZbxNmF9Ar/mI55aoR6kTCaictCjHtXYrmIRL7QXEHzqHlqDb5uil85E
	 itZH0W2Nr2+HKRNsFW+sfpJr/ZrSaxLxvOT8r9vlBYV7eCthdbRmWzvhr5UvUEHO1G
	 saEjglauTIFiIAmZ9avmxpemF5MAFOpJe7QNYdktVKwkhKbBvZe7wpdw5o5l7NPtVy
	 THZt08VRxkAIw==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5206a5854adso1345236e87.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 May 2024 10:40:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVvo3cCKcDTLKhXJnfTZGlaBSj0mtEk+G0VkBcN6+WOLrU/zW14rUqX/SB8jUGzxc9Pevw9VzJR+tbEL8Y2oLUltZj+M1tiOH0BxX5VwA==
X-Gm-Message-State: AOJu0Yyu+60r7G+gzM63jEY99zDTyi4sO3JHkW6ci4TWtZAyqOR95v1I
	vvuoaNxGDGVMvOWiNnV5bPoGck4Wk94XAorCtrg0j+J1+KwigOYVYLmfPd7ORvAGj6g5sjLAnIc
	Ry/ApNMq1y1PK5xwLk2qm6ISScZI=
X-Google-Smtp-Source: AGHT+IF2PwSZe5BMW7UX57tkHCdRf/gekRaFtM/nnS3rN0rIH+9D9ZtSjgJTnlSF1KP0G/IduPvkC/Mwd+Y5f3i6NN4=
X-Received: by 2002:a19:8c50:0:b0:518:8d15:8810 with SMTP id
 i16-20020a198c50000000b005188d158810mr6385291lfj.14.1715017203321; Mon, 06
 May 2024 10:40:03 -0700 (PDT)
MIME-Version: 1.0
References: <20240422092206.147078-1-sv@linux.ibm.com> <CAK7LNAR3R2MfP69pbXNYx3TCeQiaC-Pjb=zfnMifHRUvhCQA6w@mail.gmail.com>
 <d808e90c-a27d-47c4-b7c8-55734f24981c@linux.vnet.ibm.com>
In-Reply-To: <d808e90c-a27d-47c4-b7c8-55734f24981c@linux.vnet.ibm.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 7 May 2024 02:39:27 +0900
X-Gmail-Original-Message-ID: <CAK7LNARRqicmMs73fZgP3NJ27s8LzNi2hLLa481_Q3qJnnaDew@mail.gmail.com>
Message-ID: <CAK7LNARRqicmMs73fZgP3NJ27s8LzNi2hLLa481_Q3qJnnaDew@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] objtool: Run objtool only if either of the config
 options are selected
To: Sathvika Vasireddy <sv@linux.vnet.ibm.com>
Content-Type: multipart/mixed; boundary="000000000000302eec0617cc8ff3"
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
Cc: nicolas@fjasle.eu, linux-kbuild@vger.kernel.org, peterz@infradead.org, mahesh@linux.ibm.com, mingo@kernel.org, nathan@kernel.org, Sathvika Vasireddy <sv@linux.ibm.com>, npiggin@gmail.com, naveen.n.rao@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, jpoimboe@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--000000000000302eec0617cc8ff3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 23, 2024 at 1:19=E2=80=AFAM Sathvika Vasireddy
<sv@linux.vnet.ibm.com> wrote:
>
> Hi Masahiro, thanks for reviewing.
>
> On 4/22/24 5:39 PM, Masahiro Yamada wrote:
>
> On Mon, Apr 22, 2024 at 6:25=E2=80=AFPM Sathvika Vasireddy <sv@linux.ibm.=
com> wrote:
>
> Currently, when objtool is enabled and none of the supported options
> are triggered, kernel build errors out with the below error:
> error: objtool: At least one command required.
>
> Then, I think CONFIG_OBJTOOL should be disabled.
>
> A subsequent patch introduces --ftr-fixup as an option to objtool to do f=
eature fixup at build-time via CONFIG_HAVE_OBJTOOL_FTR_FIXUP option. If CON=
FIG_OBJTOOL is not selected, then objtool cannot be used to pass --ftr-fixu=
p option.
>
> In cases where none of the supported options (like --mcount on powerpc fo=
r example) is triggered, but still require --ftr-fixup option to be passed =
to objtool, we see "error: objtool: At least one command required" errors. =
So, to address this, run only when either of the config options are selecte=
d.
>
> Thanks,
> Sathvika



Same as my first comment.


Bad things happen because you select OBJTOOL.

Preferably, this should be a separate program
as in the first draft, but if you insist on
integrating it into objtool, I recommend keeping
CONFIG_OBJTOOL and CONFIG_HAVE_OBJTOOL_FTR_FIXUP
as separate, unlated options.


I attach a fix-up patch applicable on top of your work.




--=20
Best Regards
Masahiro Yamada

--000000000000302eec0617cc8ff3
Content-Type: text/x-patch; charset="US-ASCII"; name="patch.diff"
Content-Disposition: attachment; filename="patch.diff"
Content-Transfer-Encoding: base64
Content-ID: <f_lvv8s1az0>
X-Attachment-Id: f_lvv8s1az0

ZGlmZiAtLWdpdCBhL01ha2VmaWxlIGIvTWFrZWZpbGUKaW5kZXggNDBmYjJjYTZmZTRjLi5jNWFj
MDEyNzQ4OTMgMTAwNjQ0Ci0tLSBhL01ha2VmaWxlCisrKyBiL01ha2VmaWxlCkBAIC0xMzI3LDYg
KzEzMjcsMTMgQEAgaWZkZWYgQ09ORklHX09CSlRPT0wKIHByZXBhcmU6IHRvb2xzL29ianRvb2wK
IGVuZGlmCiAKKyMgQ09ORklHX09CSlRPT0wgYW5kIENPTkZJR19IQVZFX09CSlRPT0xfRlRSX0ZJ
WFVQIGFyZSB1bnJlbGF0ZWQsIHNlcGFyYXRlCisjIG9wdGlvbnMuIEl0IHdhcyBpbnRlZ3JhdGVk
IGluIG9ianRvb2wgaW4gb3JkZXIgdG8gYm9ycm93IHRoZSBlbGYgcGFyc2VyLAorIyBidXQgdGhp
cyBpcyBkaWZmZXJlbnQgZnJvbSBob3cgdGhlIG90aGVyIG9ianRvb2wgY29tbWFuZHMgYXJlIHVz
ZWQuCitpZmRlZiBDT05GSUdfSEFWRV9PQkpUT09MX0ZUUl9GSVhVUAorcHJlcGFyZTogdG9vbHMv
b2JqdG9vbAorZW5kaWYKKwogaWZkZWYgQ09ORklHX0JQRgogaWZkZWYgQ09ORklHX0RFQlVHX0lO
Rk9fQlRGCiBwcmVwYXJlOiB0b29scy9icGYvcmVzb2x2ZV9idGZpZHMKZGlmZiAtLWdpdCBhL2Fy
Y2gvcG93ZXJwYy9LY29uZmlnIGIvYXJjaC9wb3dlcnBjL0tjb25maWcKaW5kZXggODA2Mjg1YTI4
MjMxLi41NjRiNzNjYmZhM2QgMTAwNjQ0Ci0tLSBhL2FyY2gvcG93ZXJwYy9LY29uZmlnCisrKyBi
L2FyY2gvcG93ZXJwYy9LY29uZmlnCkBAIC0yNiw3ICsyNiw3IEBAIGNvbmZpZyA2NEJJVAogY29u
ZmlnIEhBVkVfT0JKVE9PTF9GVFJfRklYVVAKICAgICAgICAgYm9vbAogICAgICAgICBkZWZhdWx0
IHkgaWYgQ1BVX0xJVFRMRV9FTkRJQU4gJiYgUFBDNjQKLSAgICAgICAgc2VsZWN0IE9CSlRPT0wK
KwkjIEhBVkVfT0JKVE9PTF9GVFJfRklYVVAgbXVzdCBub3Qgc2VsZWN0IE9CSlRPT0wKIAogY29u
ZmlnIExJVkVQQVRDSF82NAogCWRlZl9ib29sIFBQQzY0CmRpZmYgLS1naXQgYS9zY3JpcHRzL01h
a2VmaWxlLmxpYiBiL3NjcmlwdHMvTWFrZWZpbGUubGliCmluZGV4IDhmZmYyN2I5YmRjYi4uODU1
YWQwOTdmODVlIDEwMDY0NAotLS0gYS9zY3JpcHRzL01ha2VmaWxlLmxpYgorKysgYi9zY3JpcHRz
L01ha2VmaWxlLmxpYgpAQCAtMjU3LDEwICsyNTcsMTAgQEAgZHRjX2NwcF9mbGFncyAgPSAtV3As
LU1NRCwkKGRlcGZpbGUpLnByZS50bXAgLW5vc3RkaW5jICAgICAgICAgICAgICAgICAgICBcCiAJ
CSAkKGFkZHByZWZpeCAtSSwkKERUQ19JTkNMVURFKSkgICAgICAgICAgICAgICAgICAgICAgICAg
IFwKIAkJIC11bmRlZiAtRF9fRFRTX18KIAotaWZkZWYgQ09ORklHX09CSlRPT0wKLQogb2JqdG9v
bCA6PSAkKG9ianRyZWUpL3Rvb2xzL29ianRvb2wvb2JqdG9vbAogCitpZmRlZiBDT05GSUdfT0JK
VE9PTAorCiBvYmp0b29sLWFyZ3MtJChDT05GSUdfSEFWRV9KVU1QX0xBQkVMX0hBQ0spCQkrPSAt
LWhhY2tzPWp1bXBfbGFiZWwKIG9ianRvb2wtYXJncy0kKENPTkZJR19IQVZFX05PSU5TVFJfSEFD
SykJCSs9IC0taGFja3M9bm9pbnN0cgogb2JqdG9vbC1hcmdzLSQoQ09ORklHX01JVElHQVRJT05f
Q0FMTF9ERVBUSF9UUkFDS0lORykJKz0gLS1oYWNrcz1za3lsYWtlCkBAIC0yODYsMTYgKzI4Niw3
IEBAIG9ianRvb2wtYXJncyA9ICQob2JqdG9vbC1hcmdzLXkpCQkJCQlcCiAKIGRlbGF5LW9ianRv
b2wgOj0gJChvciAkKENPTkZJR19MVE9fQ0xBTkcpLCQoQ09ORklHX1g4Nl9LRVJORUxfSUJUKSkK
IAotaWZuZXEgKCQob2JqdG9vbC1hcmdzLXkpLCkKIGNtZF9vYmp0b29sID0gJChpZiAkKG9ianRv
b2wtZW5hYmxlZCksIDsgJChvYmp0b29sKSAkKG9ianRvb2wtYXJncykgJEApCi1lbmRpZgotCi1j
bWRfb2JqdG9vbF92bWxpbnV4IDo9Ci1pZmVxICgkKENPTkZJR19IQVZFX09CSlRPT0xfRlRSX0ZJ
WFVQKSx5KQotY21kX29ianRvb2xfdm1saW51eCA9ICQoaWYgJChvYmp0b29sLWVuYWJsZWQpLCA7
ICQob2JqdG9vbCkgJChvYmp0b29sLWFyZ3MpICRAKQotdm1saW51eDoKLSAgICAkKGNtZF9vYmp0
b29sX3ZtbGludXgpCi1lbmRpZgogCiBjbWRfZ2VuX29ianRvb2xkZXAgPSAkKGlmICQob2JqdG9v
bC1lbmFibGVkKSwgeyBlY2hvIDsgZWNobyAnJEA6ICQkKHdpbGRjYXJkICQob2JqdG9vbCkpJyA7
IH0gPj4gJChkb3QtdGFyZ2V0KS5jbWQpCiAKZGlmZiAtLWdpdCBhL3NjcmlwdHMvTWFrZWZpbGUu
dm1saW51eCBiL3NjcmlwdHMvTWFrZWZpbGUudm1saW51eAppbmRleCAyZjRhNzE1NGU2NzYuLmYw
MmY5OWM2ZjM1NSAxMDA2NDQKLS0tIGEvc2NyaXB0cy9NYWtlZmlsZS52bWxpbnV4CisrKyBiL3Nj
cmlwdHMvTWFrZWZpbGUudm1saW51eApAQCAtNTgsMTAgKzU4LDkgQEAgZXhpc3RpbmctdGFyZ2V0
cyA6PSAkKHdpbGRjYXJkICQoc29ydCAkKHRhcmdldHMpKSkKICMgLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLQogIwogIyAgRm9yIGZlYXR1cmUgZml4dXAsIG9ianRvb2wgZG9lcyBu
b3QgcnVuIG9uIGluZGl2aWR1YWwKLSMgIHRyYW5zbGF0aW9uIHVuaXRzLiBSdW4gdGhpcyBvbiB2
bWxpbnV4IGluc3RlYWQuCisjICB0cmFuc2xhdGlvbiB1bml0cy4gUnVuIHRoaXMgb24gdm1saW51
eCBpbnN0ZWFkLiBPbmx5IGZvciBQb3dlclBDLgorIyAgVGhlIG90aGVyIG9ianRvb2wgY29tbWFu
ZHMgd29yayBvbiBpbmRpdmlkdWFsIG9iamVjdHMgb3Igdm1saW51eC5vLgogCi1vYmp0b29sLWVu
YWJsZWQgOj0gJChDT05GSUdfSEFWRV9PQkpUT09MX0ZUUl9GSVhVUCkKLQotdm1saW51eC1vYmp0
b29sLWFyZ3MtJChDT05GSUdfSEFWRV9PQkpUT09MX0ZUUl9GSVhVUCkgICs9IC0tZnRyLWZpeHVw
Ci0KLW9ianRvb2wtYXJncyA9ICQodm1saW51eC1vYmp0b29sLWFyZ3MteSkgLS1saW5rCitpZmRl
ZiBDT05GSUdfSEFWRV9PQkpUT09MX0ZUUl9GSVhVUAorY21kX29ianRvb2xfdm1saW51eCA9IDsg
JChvYmp0b29sKSAtLWZ0ci1maXh1cCAtLWxpbmsgJEAKK2VuZGlmCg==
--000000000000302eec0617cc8ff3--

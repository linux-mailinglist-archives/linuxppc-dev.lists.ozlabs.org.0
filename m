Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F264932775
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2024 15:28:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WNfz62RZLz3dkm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2024 23:28:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=iscas.ac.cn (client-ip=159.226.251.84; helo=cstnet.cn; envelope-from=make24@iscas.ac.cn; receiver=lists.ozlabs.org)
Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WNfyk2JZSz3cXK
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2024 23:28:12 +1000 (AEST)
Received: from icess-ProLiant-DL380-Gen10.. (unknown [183.174.60.14])
	by APP-05 (Coremail) with SMTP id zQCowAA3IyBJdZZmvOKhAw--.58290S2;
	Tue, 16 Jul 2024 21:27:52 +0800 (CST)
From: Ma Ke <make24@iscas.ac.cn>
To: mpe@ellerman.id.au
Subject: Re: [PATCH v4] cxl: Fix possible null pointer dereference in read_handle()
Date: Tue, 16 Jul 2024 21:27:37 +0800
Message-Id: <20240716132737.1642226-1-make24@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <87y163w4n4.fsf@mail.lhotse>
References: <87y163w4n4.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CM-TRANSID: zQCowAA3IyBJdZZmvOKhAw--.58290S2
X-Coremail-Antispam: 1UD129KBjvJXoWxWF1rtrWrCw1kCFy7Jr48Crg_yoW5XrWUpF
	WxJFWUArWDJa1qgF4DZa18tFyjva48tFWYgry0g3s3Zws8ZF1fJFy5Ga4F9a4q9348C340
	va1qqF9Iga1UZaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWUuVWrJwAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IE
	rcIFxwACI402YVCY1x02628vn2kIc2xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
	kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
	67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
	CI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1x
	MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIda
	VFxhVjvjDU0xZFpf9x0JUQZ23UUUUU=
X-Originating-IP: [183.174.60.14]
X-CM-SenderInfo: ppdnvj2u6l2u1dvotugofq/
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
Cc: ajd@linux.ibm.com, arnd@arndb.de, make24@iscas.ac.cn, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, manoj@linux.vnet.ibm.com, imunsie@au1.ibm.com, fbarrat@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, dan.carpenter@linaro.org, clombard@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> Michael Ellerman<mpe@ellerman.id.au> wrote:=0D
> > In read_handle(), of_get_address() may return NULL if getting address a=
nd=0D
> > size of the node failed. When of_read_number() uses prop to handle=0D
> > conversions between different byte orders, it could lead to a null poin=
ter=0D
> > dereference. Add NULL check to fix potential issue.=0D
> >=0D
> > Found by static analysis.=0D
> >=0D
> > Cc: stable@vger.kernel.org=0D
> > Fixes: 14baf4d9c739 ("cxl: Add guest-specific code")=0D
> > Signed-off-by: Ma Ke <make24@iscas.ac.cn>=0D
> > ---=0D
> > Changes in v4:=0D
> > - modified vulnerability description according to suggestions, making t=
he =0D
> > process of static analysis of vulnerabilities clearer. No active resear=
ch =0D
> > on developer behavior.=0D
> > Changes in v3:=0D
> > - fixed up the changelog text as suggestions.=0D
> > Changes in v2:=0D
> > - added an explanation of how the potential vulnerability was discovere=
d,=0D
> > but not meet the description specification requirements.=0D
> > ---=0D
> >  drivers/misc/cxl/of.c | 2 +-=0D
> >  1 file changed, 1 insertion(+), 1 deletion(-)=0D
> >=0D
> > diff --git a/drivers/misc/cxl/of.c b/drivers/misc/cxl/of.c=0D
> > index bcc005dff1c0..d8dbb3723951 100644=0D
> > --- a/drivers/misc/cxl/of.c=0D
> > +++ b/drivers/misc/cxl/of.c=0D
> > @@ -58,7 +58,7 @@ static int read_handle(struct device_node *np, u64 *h=
andle)=0D
> >  =0D
> >  	/* Get address and size of the node */=0D
> >  	prop =3D of_get_address(np, 0, &size, NULL);=0D
> > -	if (size)=0D
> > +	if (!prop || size)=0D
> >  		return -EINVAL;=0D
> >  =0D
> >  	/* Helper to read a big number; size is in cells (not bytes) */=0D
> =0D
> If you expand the context this could just use of_property_read_reg(),=0D
> something like below.=0D
> =0D
> cheers=0D
> =0D
> =0D
> diff --git a/drivers/misc/cxl/of.c b/drivers/misc/cxl/of.c=0D
> index bcc005dff1c0..a184855b2a7b 100644=0D
> --- a/drivers/misc/cxl/of.c=0D
> +++ b/drivers/misc/cxl/of.c=0D
> @@ -53,16 +53,15 @@ static const __be64 *read_prop64_dword(const struct d=
evice_node *np,=0D
>  =0D
>  static int read_handle(struct device_node *np, u64 *handle)=0D
>  {=0D
> -	const __be32 *prop;=0D
>  	u64 size;=0D
> +	=0D
> +	if (of_property_read_reg(np, 0, handle, &size))=0D
> +		return -EINVAL;=0D
>  =0D
> -	/* Get address and size of the node */=0D
> -	prop =3D of_get_address(np, 0, &size, NULL);=0D
> +	// Size must be zero per PAPR+ v2.13 =C2=A7 C.6.19=0D
>  	if (size)=0D
>  		return -EINVAL;=0D
>  =0D
> -	/* Helper to read a big number; size is in cells (not bytes) */=0D
> -	*handle =3D of_read_number(prop, of_n_addr_cells(np));=0D
>  	return 0;=0D
>  }=0D
Thank you for discussing and guiding me on the vulnerability I submitted. =
=0D
I've carefully read through your conversation with Dan Carpenter. I'm =0D
uncertain whether to use my patch or the one you provided. Could you please=
=0D
advise on which patch would be more appropriate? =0D
Looking forward to your reply.=0D
--=0D
Regards,=0D
=0D
Ma Ke=


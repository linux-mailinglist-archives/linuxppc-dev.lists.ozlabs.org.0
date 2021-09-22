Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CDD0414711
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Sep 2021 12:56:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HDwFz4fjGz2ywZ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Sep 2021 20:56:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QCEP+G15;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=ardb@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=QCEP+G15; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HDwFK584dz2xl7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Sep 2021 20:55:49 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5241961242
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Sep 2021 10:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632308147;
 bh=eAjFNRBpQJKeA1sNci8y8k2TEqXAjryf/cIS7pzJirs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=QCEP+G1581rB04BPe3Ns/O394X5b8Ba7q+VHaQDL1b8X1BPSrfQpjPOcpBcLMCAuS
 gv3UxVglS9UADktg5d3pisfzQ9vKKZGc7t5pPPs08u4GyHyMNSfpzcSyEm/fsw4Cw/
 BjoNspbxfGjPbplbQYGWhVmno7s6G1dEiJDoiW8yq+0WSsjakT4P1o19UOmgXFrFhv
 J+W46rfqta8Sd3hHgObFRVwEY9tXCqcjfoqo4xiXzNhJpPuBvjy4FhkZfEILWKbZuK
 SMRvoAQ++tkJ9iI6nztBr/QY2zQ7Z0RdTojw/9AjLarMYai1HCdfcJcwP9JStfNUqJ
 yU/qilyuLazgA==
Received: by mail-ot1-f54.google.com with SMTP id
 l16-20020a9d6a90000000b0053b71f7dc83so2858117otq.7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Sep 2021 03:55:47 -0700 (PDT)
X-Gm-Message-State: AOAM532/Qj85L5yR2+ZDU80TqgO1pQS6ZrGO2Wd8u2JPxarPoY0kGhwR
 Buqw3Gj8N5GjrF7wXod68MrDhVxAAXsPPuOzR4E=
X-Google-Smtp-Source: ABdhPJykpzKGe8v1pBQ3CR/2JU5H8EOje8Gs9fBBAHsfXDt9bn4WoL7tIPW0f+zi7s4Ivo8L5iCPFwVLaWikTkzKmHU=
X-Received: by 2002:a9d:12e2:: with SMTP id g89mr30492762otg.112.1632308146505; 
 Wed, 22 Sep 2021 03:55:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210921213930.10366-1-linkmauve@linkmauve.fr>
 <20210921213930.10366-2-linkmauve@linkmauve.fr>
 <CAMj1kXF6RpaAsN2zUgkO0NW7gMwwhXMHEEM-wpQXxeNJbGJ79A@mail.gmail.com>
 <20210922104302.22pgaoy2vspranqj@luna>
In-Reply-To: <20210922104302.22pgaoy2vspranqj@luna>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 22 Sep 2021 12:55:34 +0200
X-Gmail-Original-Message-ID: <CAMj1kXFMVQDe_t3Y3yh_VCGsW9x_PuhN-A9ACX2qVZAXYhYxHQ@mail.gmail.com>
Message-ID: <CAMj1kXFMVQDe_t3Y3yh_VCGsW9x_PuhN-A9ACX2qVZAXYhYxHQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] crypto: nintendo-aes - add a new AES driver
To: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>,
 Ash Logan <ash@heyquark.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Paul Mackerras <paulus@samba.org>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 "open list:LINUX FOR POWERPC \(32-BIT AND 64-BIT\)"
 <linuxppc-dev@lists.ozlabs.org>, "David S. Miller" <davem@davemloft.net>,
 =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.ne@posteo.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 22 Sept 2021 at 12:43, Emmanuel Gil Peyrot
<linkmauve@linkmauve.fr> wrote:
>
> On Wed, Sep 22, 2021 at 12:10:41PM +0200, Ard Biesheuvel wrote:
> > On Tue, 21 Sept 2021 at 23:49, Emmanuel Gil Peyrot
> > <linkmauve@linkmauve.fr> wrote:
> > >
> > > This engine implements AES in CBC mode, using 128-bit keys only.  It =
is
> > > present on both the Wii and the Wii U, and is apparently identical in
> > > both consoles.
> > >
> > > The hardware is capable of firing an interrupt when the operation is
> > > done, but this driver currently uses a busy loop, I=E2=80=99m not too=
 sure
> > > whether it would be preferable to switch, nor how to achieve that.
> > >
> > > It also supports a mode where no operation is done, and thus could be
> > > used as a DMA copy engine, but I don=E2=80=99t know how to expose tha=
t to the
> > > kernel or whether it would even be useful.
> > >
> > > In my testing, on a Wii U, this driver reaches 80.7 MiB/s, while the
> > > aes-generic driver only reaches 30.9 MiB/s, so it is a quite welcome
> > > speedup.
> > >
> > > This driver was written based on reversed documentation, see:
> > > https://wiibrew.org/wiki/Hardware/AES
> > >
> > > Signed-off-by: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
> > > Tested-by: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>  # on Wii U
> >
> > This is redundant - everybody should test the code they submit.
>
> Indeed, except for the comment, as I haven=E2=80=99t been able to test on=
 the
> Wii just yet and that=E2=80=99s kind of a call for doing exactly that. :)
>
> >
> > ...
> > > +       /* TODO: figure out how to use interrupts here, this will pro=
bably
> > > +        * lower throughput but let the CPU do other things while the=
 AES
> > > +        * engine is doing its work. */
> >
> > So is it worthwhile like this? How much faster is it to use this
> > accelerator rather than the CPU?
>
> As I mentioned above, on my hardware it reaches 80.7 MiB/s using this
> busy loop instead of 30.9 MiB/s using aes-generic, measured using
> `cryptsetup benchmark --cipher=3Daes --key-size=3D128`.  I expect the
> difference would be even more pronounced on the Wii, with its CPU being
> clocked lower.
>

Ah apologies for not spotting that. This is a nice speedup.

> I will give a try at using the interrupt, but I fully expect a lower
> throughput alongside a lower CPU usage (for large requests).
>

You should consider latency as well. Is it really necessary to disable
interrupts as well? A scheduling blackout of ~1ms (for the worst case
of 64k of input @ 80 MB/s) may be tolerable but keeping interrupts
disabled for that long is probably not a great idea. (Just make sure
you use spin_lock_bh() to prevent deadlocks that could occur if your
code is called from softirq context)

But using the interrupt is obviously preferred. What's wrong with it?

Btw the crypto API does not permit AES-128 only - you will need to add
a fallback for other key sizes as well.


> >
> > > +       do {
> > > +               status =3D ioread32be(base + AES_CTRL);
> > > +               cpu_relax();
> > > +       } while ((status & AES_CTRL_EXEC) && --counter);
> > > +
> > > +       /* Do we ever get called with dst =E2=89=A0 src?  If so we ha=
ve to invalidate
> > > +        * dst in addition to the earlier flush of src. */
> > > +       if (unlikely(dst !=3D src)) {
> > > +               for (i =3D 0; i < len; i +=3D 32)
> > > +                       __asm__("dcbi 0, %0" : : "r" (dst + i));
> > > +               __asm__("sync" : : : "memory");
> > > +       }
> > > +
> > > +       return counter ? 0 : 1;
> > > +}
> > > +
> > > +static void
> > > +nintendo_aes_crypt(const void *src, void *dst, u32 len, u8 *iv, int =
dir,
> > > +                  bool firstchunk)
> > > +{
> > > +       u32 flags =3D 0;
> > > +       unsigned long iflags;
> > > +       int ret;
> > > +
> > > +       flags |=3D AES_CTRL_EXEC_INIT /* | AES_CTRL_IRQ */ | AES_CTRL=
_ENA;
> > > +
> > > +       if (dir =3D=3D AES_DIR_DECRYPT)
> > > +               flags |=3D AES_CTRL_DEC;
> > > +
> > > +       if (!firstchunk)
> > > +               flags |=3D AES_CTRL_IV;
> > > +
> > > +       /* Start the critical section */
> > > +       spin_lock_irqsave(&lock, iflags);
> > > +
> > > +       if (firstchunk)
> > > +               writefield(AES_IV, iv);
> > > +
> > > +       ret =3D do_crypt(src, dst, len, flags);
> > > +       BUG_ON(ret);
> > > +
> > > +       spin_unlock_irqrestore(&lock, iflags);
> > > +}
> > > +
> > > +static int nintendo_setkey_skcipher(struct crypto_skcipher *tfm, con=
st u8 *key,
> > > +                                   unsigned int len)
> > > +{
> > > +       /* The hardware only supports AES-128 */
> > > +       if (len !=3D AES_KEYSIZE_128)
> > > +               return -EINVAL;
> > > +
> > > +       writefield(AES_KEY, key);
> > > +       return 0;
> > > +}
> > > +
> > > +static int nintendo_skcipher_crypt(struct skcipher_request *req, int=
 dir)
> > > +{
> > > +       struct skcipher_walk walk;
> > > +       unsigned int nbytes;
> > > +       int err;
> > > +       char ivbuf[AES_BLOCK_SIZE];
> > > +       unsigned int ivsize;
> > > +
> > > +       bool firstchunk =3D true;
> > > +
> > > +       /* Reset the engine */
> > > +       iowrite32be(0, base + AES_CTRL);
> > > +
> > > +       err =3D skcipher_walk_virt(&walk, req, false);
> > > +       ivsize =3D min(sizeof(ivbuf), walk.ivsize);
> > > +
> > > +       while ((nbytes =3D walk.nbytes) !=3D 0) {
> > > +               unsigned int chunkbytes =3D round_down(nbytes, AES_BL=
OCK_SIZE);
> > > +               unsigned int ret =3D nbytes % AES_BLOCK_SIZE;
> > > +
> > > +               if (walk.total =3D=3D chunkbytes && dir =3D=3D AES_DI=
R_DECRYPT) {
> > > +                       /* If this is the last chunk and we're decryp=
ting, take
> > > +                        * note of the IV (which is the last cipherte=
xt block)
> > > +                        */
> > > +                       memcpy(ivbuf, walk.src.virt.addr + walk.total=
 - ivsize,
> > > +                              ivsize);
> > > +               }
> > > +
> > > +               nintendo_aes_crypt(walk.src.virt.addr, walk.dst.virt.=
addr,
> > > +                                  chunkbytes, walk.iv, dir, firstchu=
nk);
> > > +
> > > +               if (walk.total =3D=3D chunkbytes && dir =3D=3D AES_DI=
R_ENCRYPT) {
> > > +                       /* If this is the last chunk and we're encryp=
ting, take
> > > +                        * note of the IV (which is the last cipherte=
xt block)
> > > +                        */
> > > +                       memcpy(walk.iv,
> > > +                              walk.dst.virt.addr + walk.total - ivsi=
ze,
> > > +                              ivsize);
> > > +               } else if (walk.total =3D=3D chunkbytes && dir =3D=3D=
 AES_DIR_DECRYPT) {
> > > +                       memcpy(walk.iv, ivbuf, ivsize);
> > > +               }
> > > +
> > > +               err =3D skcipher_walk_done(&walk, ret);
> > > +               firstchunk =3D false;
> > > +       }
> > > +
> > > +       return err;
> > > +}
> > > +
> > > +static int nintendo_cbc_encrypt(struct skcipher_request *req)
> > > +{
> > > +       return nintendo_skcipher_crypt(req, AES_DIR_ENCRYPT);
> > > +}
> > > +
> > > +static int nintendo_cbc_decrypt(struct skcipher_request *req)
> > > +{
> > > +       return nintendo_skcipher_crypt(req, AES_DIR_DECRYPT);
> > > +}
> > > +
> > > +static struct skcipher_alg nintendo_alg =3D {
> > > +       .base.cra_name          =3D "cbc(aes)",
> > > +       .base.cra_driver_name   =3D "cbc-aes-nintendo",
> > > +       .base.cra_priority      =3D 400,
> > > +       .base.cra_flags         =3D CRYPTO_ALG_KERN_DRIVER_ONLY,
> > > +       .base.cra_blocksize     =3D AES_BLOCK_SIZE,
> > > +       .base.cra_alignmask     =3D 15,
> > > +       .base.cra_module        =3D THIS_MODULE,
> > > +       .setkey                 =3D nintendo_setkey_skcipher,
> > > +       .encrypt                =3D nintendo_cbc_encrypt,
> > > +       .decrypt                =3D nintendo_cbc_decrypt,
> > > +       .min_keysize            =3D AES_KEYSIZE_128,
> > > +       .max_keysize            =3D AES_KEYSIZE_128,
> > > +       .ivsize                 =3D AES_BLOCK_SIZE,
> > > +};
> > > +
> > > +static int nintendo_aes_remove(struct platform_device *pdev)
> > > +{
> > > +       struct device *dev =3D &pdev->dev;
> > > +
> > > +       crypto_unregister_skcipher(&nintendo_alg);
> > > +       devm_iounmap(dev, base);
> > > +       base =3D NULL;
> > > +
> > > +       return 0;
> > > +}
> > > +
> > > +static int nintendo_aes_probe(struct platform_device *pdev)
> > > +{
> > > +       struct device *dev =3D &pdev->dev;
> > > +       struct resource *res;
> > > +       int ret;
> > > +
> > > +       res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > > +       base =3D devm_ioremap_resource(dev, res);
> > > +       if (IS_ERR(base))
> > > +               return PTR_ERR(base);
> > > +
> > > +       spin_lock_init(&lock);
> > > +
> > > +       ret =3D crypto_register_skcipher(&nintendo_alg);
> > > +       if (ret)
> > > +               goto eiomap;
> > > +
> > > +       dev_notice(dev, "Nintendo Wii and Wii U AES engine enabled\n"=
);
> > > +       return 0;
> > > +
> > > + eiomap:
> > > +       devm_iounmap(dev, base);
> > > +
> > > +       dev_err(dev, "Nintendo Wii and Wii U AES initialization faile=
d\n");
> > > +       return ret;
> > > +}
> > > +
> > > +static const struct of_device_id nintendo_aes_of_match[] =3D {
> > > +       { .compatible =3D "nintendo,hollywood-aes", },
> > > +       { .compatible =3D "nintendo,latte-aes", },
> > > +       {/* sentinel */},
> > > +};
> > > +MODULE_DEVICE_TABLE(of, nintendo_aes_of_match);
> > > +
> > > +static struct platform_driver nintendo_aes_driver =3D {
> > > +       .driver =3D {
> > > +               .name =3D "nintendo-aes",
> > > +               .of_match_table =3D nintendo_aes_of_match,
> > > +       },
> > > +       .probe =3D nintendo_aes_probe,
> > > +       .remove =3D nintendo_aes_remove,
> > > +};
> > > +
> > > +module_platform_driver(nintendo_aes_driver);
> > > +
> > > +MODULE_AUTHOR("Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>");
> > > +MODULE_DESCRIPTION("Nintendo Wii and Wii U Hardware AES driver");
> > > +MODULE_LICENSE("GPL");
> > > --
> > > 2.33.0
> > >
>
> --
> Emmanuel Gil Peyrot

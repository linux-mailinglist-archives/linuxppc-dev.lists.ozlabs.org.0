Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED9C4145CE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Sep 2021 12:11:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HDvGD3BLdz2yZf
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Sep 2021 20:11:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VvBsCRHh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=ardb@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=VvBsCRHh; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HDvFY2hSfz2xvf
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Sep 2021 20:10:57 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4661F611C9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Sep 2021 10:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632305454;
 bh=XZApaAHK+8eKA8jUnLJ2HYEY5F8KHUNinsnPqP3/24g=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=VvBsCRHhNQXooQ+nE/JbVKrAtI8qZ3rIKd2UX5zQsxXCS1FChs0NCWdOxt/iUR5hU
 RpSBM3egVAXYWoMHchTl9NFDp6LW4bQeG8g4hY0DUh6nb6PXTsJUclRK38HQOipLTL
 gERVX696OG0+pKkkEBdWj3/lTj6kbkUknY4m3Iu1uKBPPKRssAPDvwpdkPZPRXxFcb
 dlU78Aj0x5w5TLIapsn3Hm6bMd6MtnOb6fwrlJaTrvKMYJgC4IN5XlQPfy2LqJmfK4
 lbommSYIeOAhtD/lPbqShYbJ8VGIzNn3rKgijWgOqXsaToVWEX7YOhFFLxTDHjCz3O
 Go4czYXY0ICCw==
Received: by mail-oi1-f172.google.com with SMTP id v10so3586763oic.12
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Sep 2021 03:10:54 -0700 (PDT)
X-Gm-Message-State: AOAM532Rzo1WijcXzao2nOeztXZavc4KlCLPknj2nptf56rnWmwkVsj8
 GqFhoZZGTCp9zGC/8lWT/B8CNJV3DQUD5PkV+X0=
X-Google-Smtp-Source: ABdhPJxY7RKemNzkKOmobzDTMPzrir9yE57gTkEGgw1n0WEteHo51nxZbrdEiulNM8zOF818yvNv0Zi7qLU/m+UGbQs=
X-Received: by 2002:a05:6808:1148:: with SMTP id
 u8mr5295141oiu.33.1632305453483; 
 Wed, 22 Sep 2021 03:10:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210921213930.10366-1-linkmauve@linkmauve.fr>
 <20210921213930.10366-2-linkmauve@linkmauve.fr>
In-Reply-To: <20210921213930.10366-2-linkmauve@linkmauve.fr>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 22 Sep 2021 12:10:41 +0200
X-Gmail-Original-Message-ID: <CAMj1kXF6RpaAsN2zUgkO0NW7gMwwhXMHEEM-wpQXxeNJbGJ79A@mail.gmail.com>
Message-ID: <CAMj1kXF6RpaAsN2zUgkO0NW7gMwwhXMHEEM-wpQXxeNJbGJ79A@mail.gmail.com>
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

On Tue, 21 Sept 2021 at 23:49, Emmanuel Gil Peyrot
<linkmauve@linkmauve.fr> wrote:
>
> This engine implements AES in CBC mode, using 128-bit keys only.  It is
> present on both the Wii and the Wii U, and is apparently identical in
> both consoles.
>
> The hardware is capable of firing an interrupt when the operation is
> done, but this driver currently uses a busy loop, I=E2=80=99m not too sur=
e
> whether it would be preferable to switch, nor how to achieve that.
>
> It also supports a mode where no operation is done, and thus could be
> used as a DMA copy engine, but I don=E2=80=99t know how to expose that to=
 the
> kernel or whether it would even be useful.
>
> In my testing, on a Wii U, this driver reaches 80.7 MiB/s, while the
> aes-generic driver only reaches 30.9 MiB/s, so it is a quite welcome
> speedup.
>
> This driver was written based on reversed documentation, see:
> https://wiibrew.org/wiki/Hardware/AES
>
> Signed-off-by: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
> Tested-by: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>  # on Wii U

This is redundant - everybody should test the code they submit.

...
> +       /* TODO: figure out how to use interrupts here, this will probabl=
y
> +        * lower throughput but let the CPU do other things while the AES
> +        * engine is doing its work. */

So is it worthwhile like this? How much faster is it to use this
accelerator rather than the CPU?

> +       do {
> +               status =3D ioread32be(base + AES_CTRL);
> +               cpu_relax();
> +       } while ((status & AES_CTRL_EXEC) && --counter);
> +
> +       /* Do we ever get called with dst =E2=89=A0 src?  If so we have t=
o invalidate
> +        * dst in addition to the earlier flush of src. */
> +       if (unlikely(dst !=3D src)) {
> +               for (i =3D 0; i < len; i +=3D 32)
> +                       __asm__("dcbi 0, %0" : : "r" (dst + i));
> +               __asm__("sync" : : : "memory");
> +       }
> +
> +       return counter ? 0 : 1;
> +}
> +
> +static void
> +nintendo_aes_crypt(const void *src, void *dst, u32 len, u8 *iv, int dir,
> +                  bool firstchunk)
> +{
> +       u32 flags =3D 0;
> +       unsigned long iflags;
> +       int ret;
> +
> +       flags |=3D AES_CTRL_EXEC_INIT /* | AES_CTRL_IRQ */ | AES_CTRL_ENA=
;
> +
> +       if (dir =3D=3D AES_DIR_DECRYPT)
> +               flags |=3D AES_CTRL_DEC;
> +
> +       if (!firstchunk)
> +               flags |=3D AES_CTRL_IV;
> +
> +       /* Start the critical section */
> +       spin_lock_irqsave(&lock, iflags);
> +
> +       if (firstchunk)
> +               writefield(AES_IV, iv);
> +
> +       ret =3D do_crypt(src, dst, len, flags);
> +       BUG_ON(ret);
> +
> +       spin_unlock_irqrestore(&lock, iflags);
> +}
> +
> +static int nintendo_setkey_skcipher(struct crypto_skcipher *tfm, const u=
8 *key,
> +                                   unsigned int len)
> +{
> +       /* The hardware only supports AES-128 */
> +       if (len !=3D AES_KEYSIZE_128)
> +               return -EINVAL;
> +
> +       writefield(AES_KEY, key);
> +       return 0;
> +}
> +
> +static int nintendo_skcipher_crypt(struct skcipher_request *req, int dir=
)
> +{
> +       struct skcipher_walk walk;
> +       unsigned int nbytes;
> +       int err;
> +       char ivbuf[AES_BLOCK_SIZE];
> +       unsigned int ivsize;
> +
> +       bool firstchunk =3D true;
> +
> +       /* Reset the engine */
> +       iowrite32be(0, base + AES_CTRL);
> +
> +       err =3D skcipher_walk_virt(&walk, req, false);
> +       ivsize =3D min(sizeof(ivbuf), walk.ivsize);
> +
> +       while ((nbytes =3D walk.nbytes) !=3D 0) {
> +               unsigned int chunkbytes =3D round_down(nbytes, AES_BLOCK_=
SIZE);
> +               unsigned int ret =3D nbytes % AES_BLOCK_SIZE;
> +
> +               if (walk.total =3D=3D chunkbytes && dir =3D=3D AES_DIR_DE=
CRYPT) {
> +                       /* If this is the last chunk and we're decrypting=
, take
> +                        * note of the IV (which is the last ciphertext b=
lock)
> +                        */
> +                       memcpy(ivbuf, walk.src.virt.addr + walk.total - i=
vsize,
> +                              ivsize);
> +               }
> +
> +               nintendo_aes_crypt(walk.src.virt.addr, walk.dst.virt.addr=
,
> +                                  chunkbytes, walk.iv, dir, firstchunk);
> +
> +               if (walk.total =3D=3D chunkbytes && dir =3D=3D AES_DIR_EN=
CRYPT) {
> +                       /* If this is the last chunk and we're encrypting=
, take
> +                        * note of the IV (which is the last ciphertext b=
lock)
> +                        */
> +                       memcpy(walk.iv,
> +                              walk.dst.virt.addr + walk.total - ivsize,
> +                              ivsize);
> +               } else if (walk.total =3D=3D chunkbytes && dir =3D=3D AES=
_DIR_DECRYPT) {
> +                       memcpy(walk.iv, ivbuf, ivsize);
> +               }
> +
> +               err =3D skcipher_walk_done(&walk, ret);
> +               firstchunk =3D false;
> +       }
> +
> +       return err;
> +}
> +
> +static int nintendo_cbc_encrypt(struct skcipher_request *req)
> +{
> +       return nintendo_skcipher_crypt(req, AES_DIR_ENCRYPT);
> +}
> +
> +static int nintendo_cbc_decrypt(struct skcipher_request *req)
> +{
> +       return nintendo_skcipher_crypt(req, AES_DIR_DECRYPT);
> +}
> +
> +static struct skcipher_alg nintendo_alg =3D {
> +       .base.cra_name          =3D "cbc(aes)",
> +       .base.cra_driver_name   =3D "cbc-aes-nintendo",
> +       .base.cra_priority      =3D 400,
> +       .base.cra_flags         =3D CRYPTO_ALG_KERN_DRIVER_ONLY,
> +       .base.cra_blocksize     =3D AES_BLOCK_SIZE,
> +       .base.cra_alignmask     =3D 15,
> +       .base.cra_module        =3D THIS_MODULE,
> +       .setkey                 =3D nintendo_setkey_skcipher,
> +       .encrypt                =3D nintendo_cbc_encrypt,
> +       .decrypt                =3D nintendo_cbc_decrypt,
> +       .min_keysize            =3D AES_KEYSIZE_128,
> +       .max_keysize            =3D AES_KEYSIZE_128,
> +       .ivsize                 =3D AES_BLOCK_SIZE,
> +};
> +
> +static int nintendo_aes_remove(struct platform_device *pdev)
> +{
> +       struct device *dev =3D &pdev->dev;
> +
> +       crypto_unregister_skcipher(&nintendo_alg);
> +       devm_iounmap(dev, base);
> +       base =3D NULL;
> +
> +       return 0;
> +}
> +
> +static int nintendo_aes_probe(struct platform_device *pdev)
> +{
> +       struct device *dev =3D &pdev->dev;
> +       struct resource *res;
> +       int ret;
> +
> +       res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       base =3D devm_ioremap_resource(dev, res);
> +       if (IS_ERR(base))
> +               return PTR_ERR(base);
> +
> +       spin_lock_init(&lock);
> +
> +       ret =3D crypto_register_skcipher(&nintendo_alg);
> +       if (ret)
> +               goto eiomap;
> +
> +       dev_notice(dev, "Nintendo Wii and Wii U AES engine enabled\n");
> +       return 0;
> +
> + eiomap:
> +       devm_iounmap(dev, base);
> +
> +       dev_err(dev, "Nintendo Wii and Wii U AES initialization failed\n"=
);
> +       return ret;
> +}
> +
> +static const struct of_device_id nintendo_aes_of_match[] =3D {
> +       { .compatible =3D "nintendo,hollywood-aes", },
> +       { .compatible =3D "nintendo,latte-aes", },
> +       {/* sentinel */},
> +};
> +MODULE_DEVICE_TABLE(of, nintendo_aes_of_match);
> +
> +static struct platform_driver nintendo_aes_driver =3D {
> +       .driver =3D {
> +               .name =3D "nintendo-aes",
> +               .of_match_table =3D nintendo_aes_of_match,
> +       },
> +       .probe =3D nintendo_aes_probe,
> +       .remove =3D nintendo_aes_remove,
> +};
> +
> +module_platform_driver(nintendo_aes_driver);
> +
> +MODULE_AUTHOR("Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>");
> +MODULE_DESCRIPTION("Nintendo Wii and Wii U Hardware AES driver");
> +MODULE_LICENSE("GPL");
> --
> 2.33.0
>

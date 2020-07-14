Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C123722005F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 00:03:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B5vfx1XyBzDqSg
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 08:03:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.17.10; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B5vd92GPmzDqVc
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jul 2020 08:02:19 +1000 (AEST)
Received: from mail-qv1-f50.google.com ([209.85.219.50]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MoNu2-1kfmAw1THk-00onmH for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jul
 2020 00:02:14 +0200
Received: by mail-qv1-f50.google.com with SMTP id m8so13979qvk.7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jul 2020 15:02:13 -0700 (PDT)
X-Gm-Message-State: AOAM5320qNpeHtaPOqaIPokkWfz5u2iCRVPzc3xk/MbeHK+D/3FqNOEy
 +aBjJ+qxLiwA/+bCxwvj+odaxF2VRwGXErmAnXo=
X-Google-Smtp-Source: ABdhPJznSzLhDwcnDZmpeVRogK9o+2OI/Kw97MVSd98PzQaS/otI9FtvjiXpPZMRdXNdxDurpAOdHjSmk9v+bKI3/P4=
X-Received: by 2002:a0c:f802:: with SMTP id r2mr6638892qvn.197.1594764132842; 
 Tue, 14 Jul 2020 15:02:12 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a3NWSZw6678k1O2eJ6-c5GuW7484PRvEzU9MEPPrCD-yw@mail.gmail.com>
 <20200714184550.GA397277@bjorn-Precision-5520>
In-Reply-To: <20200714184550.GA397277@bjorn-Precision-5520>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 15 Jul 2020 00:01:56 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3EZX8=649R9cYF6_=ivh1Xyrgsc5mUtS=d5yvQ3doZaQ@mail.gmail.com>
Message-ID: <CAK8P3a3EZX8=649R9cYF6_=ivh1Xyrgsc5mUtS=d5yvQ3doZaQ@mail.gmail.com>
Subject: Re: [RFC PATCH 00/35] Move all PCIBIOS* definitions into arch/x86
To: Bjorn Helgaas <helgaas@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:m8RWwIb77vG7p0WvDXdc0m1oXoIDgGVFODKlUV3HqL2/acD6K7S
 ZLIxzFuOk5zuKqmXEzmBMkv6HBMxxKYn+6Vd6AnOfzL/flFCr2a046fIm+rSEk1/VMH+mfd
 lSr7TcYZh5UPTFWjij0BcLhLmEyQGO3CBwx+q0FSuF9+lLyRmZE3U+p6SlYpi6XvkotM7NT
 did0Ackj0KwKNbreHYU7A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:8v3vtBH7QnY=:FkJnsYzu3RuKLby0ohBB7T
 jNIoLLIShoFjOsHTG7PuX1OsUNfvkzG9mrjM3TU5IVUUNt5LiMFVtvrfqW4Nw3YIxnWlJQuGh
 r5cUaZEjOaiwKEBcEY+JiFVEuHcgHzRTVL6yq0OR8jGbflxPC6ozqRWDmEe5yZYcU0HPeUF3x
 LAbIvaKFdx3U8JQVjy8mrnYVLB+lRqiffD4qSs9ORqCfqNBsjOjLVMdT7Mfq38Shl5Bg6VSIy
 m0ZdUsvRO9XJBzGiRk4WIrnLWth06TNDGPhp6Crtgvx4wsKl5eHGTfxY2XeKaH7G8SfhHuoeA
 5CXOAzL3bTu/Op/iJheyizGifDS9WB6/LpPr4x6vlCy2N5sF6XO0fLsG2GHzsK9f46cPvEVXw
 zUlWyIZBhUL/hj8JbphfRbDdkJtBdMj0+DJCa9xOWm0h43deP3A2Gkx+p+YXuGvMmvkzadVIa
 5S85R7wDHSdDsMNploG9xz24aten78hyPuGvm0nYh1fqKloTqyqQe11WMM8oaT/A3KV2v9k6/
 koIDeYG6yjNiULLQEabHWUQZyE5jCkccwVjjyBZJeBQdsp62TRXack4z+QZ9hcG2S9ZH+Un0n
 wffZkjYNmK3w1VJuMhTmx+lKvGU55rmSo8VJfBaquVuL4v0QU/+Jw5Us9rMOJEZvG7LXs+iSO
 6/DtJ1zwwOHbg5a6FlwhC/kM3Zw7S0L2sm0L5o6B2iG/cogE8NVl4s326Tv3XzAw5rY0hSAVy
 vhjUzLpBXbWuMJ1YDKyZxghXv6NNURg18qv9QoxIO1Q7F9kKvmynm9jhbrP59sWhKojhepFfr
 34xg1176wPqmzt1cd0z7aXZ5MmxjYyTSuu6l2t9ZMcM28h7PR9u1Wt6+MQCJXun5zQx3dup4z
 boQSbqG5IVTKIdyGwA/EyLjSS5kBhnqGjJw5H3J+Bx28EhEJL/d75BCdNKr224I6PTfEL+6J4
 OIwaeVR0UxYu71ZIqcy9bVeRGRH34DMU5m2c/wWdFIVoLtkIc3LQa
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
Cc: Keith Busch <kbusch@kernel.org>, Paul Mackerras <paulus@samba.org>,
 sparclinux <sparclinux@vger.kernel.org>, Toan Le <toan@os.amperecomputing.com>,
 Greg Ungerer <gerg@linux-m68k.org>,
 Marek Vasut <marek.vasut+renesas@gmail.com>, Rob Herring <robh@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Sagi Grimberg <sagi@grimberg.me>, Russell King <linux@armlinux.org.uk>,
 Ley Foon Tan <ley.foon.tan@intel.com>, Christoph Hellwig <hch@lst.de>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Kevin Hilman <khilman@baylibre.com>,
 linux-pci <linux-pci@vger.kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Matt Turner <mattst88@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Guenter Roeck <linux@roeck-us.net>, Ray Jui <rjui@broadcom.com>,
 Jens Axboe <axboe@fb.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Shuah Khan <skhan@linuxfoundation.org>, bjorn@helgaas.com,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Richard Henderson <rth@twiddle.net>, Juergen Gross <jgross@suse.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Scott Branden <sbranden@broadcom.com>, Jingoo Han <jingoohan1@gmail.com>,
 "Saheed O. Bolarinwa" <refactormyself@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 14, 2020 at 8:45 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
> On Mon, Jul 13, 2020 at 05:08:10PM +0200, Arnd Bergmann wrote:
> > On Mon, Jul 13, 2020 at 3:22 PM Saheed O. Bolarinwa
> > Starting with a), my first question is whether any high-level
> > drivers even need to care about errors from these functions. I see
> > 4913 callers that ignore the return code, and 576 that actually
> > check it, and almost none care about the specific error (as you
> > found as well). Unless we conclude that most PCI drivers are wrong,
> > could we just change the return type to 'void' and assume they never
> > fail for valid arguments on a valid pci_device* ?
>
> I really like this idea.
>
> pci_write_config_*() has one return value, and only 100ish of 2500
> callers check for errors.  It's sometimes possible for config
> accessors to detect PCI errors and return failure, e.g., device was
> removed or didn't respond, but most of them don't, and detecting these
> errors is not really that valuable.
>
> pci_read_config_*() is much more interesting because it returns two
> things, the function return value and the value read from the PCI
> device, and it's complicated to check both.
>
> Again it's sometimes possible for config read accessors to detect PCI
> errors, but in most cases a PCI error means the accessor returns
> success and the value from PCI is ~0.
>
> Checking the function return value catches programming errors (bad
> alignment, etc) but misses most of the interesting errors (device was
> unplugged or reported a PCI error).

My thinking was more that most of the time the error checking may
be completely bogus to start with, and I would just not check for
errors at all.

> Checking the value returned from PCI is tricky because ~0 is a valid
> value for some config registers, and only the driver knows for sure.
> If the driver knows that ~0 is a possible value, it would have to do
> something else, e.g., another config read of a register that *cannot*
> be ~0, to see whether it's really an error.
>
> I suspect that if we had a single value to look at it would be easier
> to get right.  Error checking with current interface would look like
> this:
>
>   err = pci_read_config_word(dev, addr, &val);
>   if (err)
>     return -EINVAL;
>
>   if (PCI_POSSIBLE_ERROR(val)) {
>     /* if driver knows ~0 is invalid */
>     return -EINVAL;
>
>     /* if ~0 is potentially a valid value */
>     err = pci_read_config_word(dev, PCI_VENDOR_ID, &val2);
>     if (err)
>       return -EINVAL;
>
>     if (PCI_POSSIBLE_ERROR(val2))
>       return -EINVAL;
>   }
>
> Error checking with a possible interface that returned only a single
> value could look like this:
>
>   val = pci_config_read_word(dev, addr);
>   if (PCI_POSSIBLE_ERROR(val)) {
>     /* if driver knows ~0 is invalid */
>     return -EINVAL;
>
>     /* if ~0 is potentially a valid value */
>     val2 = pci_config_read_word(dev, PCI_VENDOR_ID);
>     if (PCI_POSSIBLE_ERROR(val2))
>       return -EINVAL;
>   }
>
> Am I understanding you correctly?

That would require changing all callers of the function, which
I think would involve changing some 700 files. What I was
suggesting was to only change the return type to void and
categorize all drivers that today check it as either

a) checking the return code is not helpful, or possibly even
    wrong, so we just stop doing it. I expect those to be the
    vast majority of callers, but that could be wrong.

b) Code that legitimately check the error code and need to
   take an appropriate action. These could be changed to
   calling a different interface such as 'pci_bus_read_config_word'
   or a new 'pci_device_last_error()' function.

The reasons I suspect that most callers don't actually need
to check for errors are:

- Most error checking is static: PCIBIOS_BAD_REGISTER_NUMBER
  only happens if you pass an invalid register number, but most
  callers pass a compile-time constant register number that is
  known to be correct, or the driver would never work. Similarly,
  PCIBIOS_DEVICE_NOT_FOUND wouldn't normally happen
  since you pass a valid pci_device pointer that was already
  probed.

- config space accesses are very rare compared to memory
  space access and on the hardware side the error handling
  would be similar, but readl/writel don't return errors, they just
  access wrong registers or return 0xffffffff.
  arch/powerpc/kernel/eeh.c has a ton extra code written to
  deal with it, but no other architectures do.

- If we add code to detect errors in pci_read_config_*
  and do some of the stuff from powerpc's
  eeh_dev_check_failure(), we are more likely to catch
  intermittent failures when drivers don't check, or bugs
  with invalid arguments in device drivers than relying on
  drivers to get their error handling right when those code
  paths don't ever get covered in normal testing.

Looking at a couple of random drivers that do check the
return codes, I find:

drivers/edac/amd8131_edac.c: prints the register number,
then keeps going. This is not useful

drivers/net/ethernet/mellanox/mlx4/reset.c: error handling
in mlx4_reset() seems reasonable, but it gets called
from mlx4_pci_resume(), which has a 'void' return code and
cannot propagate the error further. My guess is that it
would try to keep going after a failed resume and run into
random other problems then.

drivers/ata/pata_cs5536.c: error code gets passed to
caller and then always ignored. Can clearly be changed

drivers/net/wireless/intersil/prism54/islpci_hotplug.c:
Out of two calls, only one is checked, which seems bogus

drivers/usb/host/pci-quirks.c: only one of many instances
has a check, again this seems bogus.

drivers/leds/leds-ss4200.c: called from probe(), which
seems to correctly deal with errors by failing the probe.
Not sure this can ever fail though, since the driver only does
it after pci_enable_device() succeeds first. Note that
pci_enable_device() ignores pci_read_config_byte()
errors but sanity-checks the register contents/

        Arnd

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BE38821FFC1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jul 2020 23:12:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B5tX50gCpzDqc5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 07:12:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::144;
 helo=mail-il1-x144.google.com; envelope-from=oftedal@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=cUVYKmbu; dkim-atps=neutral
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B5tT400s2zDqXM
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jul 2020 07:10:15 +1000 (AEST)
Received: by mail-il1-x144.google.com with SMTP id s21so65934ilk.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jul 2020 14:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=2npQXh+dkmWmSHKIQodxnxIAaeJj1A/FFr2Ll6AD3Hs=;
 b=cUVYKmbuMquj1tPPomJ3QAhJreggNlTpwsACBo1UIJy8ABrEJRvYcUBJ+BzMm+B8Pw
 MqSqKdxiUZLp3/SF8aRm3MPFEOcuXTXzReaF83C04QfRQHgm5C83Tljo6P1xGnktBhzD
 OT+ejuCCRxGNB8MkOVi2pHeVYazL4B1RPNhoCnI8kHFaP6uAtl1cDWerw9s1oH2TTw0B
 LM7J/Ue++Hb1A6pAPvTDsxvbkSlC8xNFDSx4dnf7ckP1Hwf+uHJfUVUzdHq5jQZARzeY
 kP3Kn/qUbeuD8v9JUHRLTRkHEjvJZJQ63Z+mmdiHUET6RLX7HxZvg2kwWAFQoo3rA3v3
 6aTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=2npQXh+dkmWmSHKIQodxnxIAaeJj1A/FFr2Ll6AD3Hs=;
 b=fZKmBki/xyLEhPBguCaC/CzvQIVtaUgHIA8QfYPjxe+g0u+vBru01ZVAh01bCtnOWm
 1stbGTLt8YE70tC7UHdfGau3HIqJYZRNrymRYIiWDhopbXIReSx0gCLCdie3UmRdGtkQ
 23eBtJwXCresw+rM5EioEyRi1ddx80HmQuvaeaLKjDFXITNYfS3/Xa1M7i9JiWhOi4BO
 4oYzttSfNOR2sbnpXPO6PLVO8Z7JQ7fgjVaU0svzo0rHcsxmOMF1tfKboUrCwp0rc1+i
 TH0iPcTMXQQi4+mUJfxATjbntVt0J5OKGYLga+L7A7mocz4u8TrGTgacd6Ojrux69eeJ
 /dQA==
X-Gm-Message-State: AOAM531KpTR2t7exPKtw9W77cxWzB7JHjjAbutS5AINcYpuSw++iZ3ti
 jq5IWET5Bc7janiEv671wJ4IQLhtEJgCQ79sM7G2jemerMw=
X-Google-Smtp-Source: ABdhPJwkddnl6FvRyOMdkmyyDRG9lWADdbl/Rct2E+/PQzsVJk9f8CH9Av6NUhTRswYDc3FssSb6pCSldchYVLW9F38=
X-Received: by 2002:a92:9a4f:: with SMTP id t76mr6568425ili.174.1594760561627; 
 Tue, 14 Jul 2020 14:02:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6602:21d8:0:0:0:0 with HTTP; Tue, 14 Jul 2020 14:02:40
 -0700 (PDT)
In-Reply-To: <20200714184550.GA397277@bjorn-Precision-5520>
References: <CAK8P3a3NWSZw6678k1O2eJ6-c5GuW7484PRvEzU9MEPPrCD-yw@mail.gmail.com>
 <20200714184550.GA397277@bjorn-Precision-5520>
From: Kjetil Oftedal <oftedal@gmail.com>
Date: Tue, 14 Jul 2020 23:02:40 +0200
Message-ID: <CALMQjD9OVTbLVPGX-9+GDekZ02Wsqdz57-k1uCBMXC7cT3K_7w@mail.gmail.com>
Subject: Re: [RFC PATCH 00/35] Move all PCIBIOS* definitions into arch/x86
To: Bjorn Helgaas <helgaas@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
 Guenter Roeck <linux@roeck-us.net>, Arnd Bergmann <arnd@arndb.de>,
 Ray Jui <rjui@broadcom.com>, Jens Axboe <axboe@fb.com>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
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

On 14/07/2020, Bjorn Helgaas <helgaas@kernel.org> wrote:

>>
>> a) callers of the high-level config space accessors
>>    pci_{write,read}_config_{byte,word,dword}, mostly in device
>>    drivers.
>> b) low-level implementation of the config space accessors
>>     through struct pci_ops
>> c) all other occurrences of these constants
>>
>> Starting with a), my first question is whether any high-level
>> drivers even need to care about errors from these functions. I see
>> 4913 callers that ignore the return code, and 576 that actually
>> check it, and almost none care about the specific error (as you
>> found as well). Unless we conclude that most PCI drivers are wrong,
>> could we just change the return type to 'void' and assume they never
>> fail for valid arguments on a valid pci_device* ?
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
>
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

Let us not do this. Reading config space is really expensive on some
architectures. Requiring a driver to do it twice on some values does not
improve upon that situation. And is quite redundant if the Root Complex
driver already knows that the first access has failed.

Additionally since multiple config accesses to the same devices is not
allowed in the spec, the hardware must block and wait for a timeout if
a config access does not get a response.
(Can happen if a intermediate link between the RC and endpoint has to retrain)
Having to block twice is very much not ideal. And in the case with
retraining the secondary access might even succeed. As the link might
recover between reading the first config word and reading PCI_VENDOR_ID.
Thus allowing the driver to accept invalid data from the device.

>
>> For b), it might be nice to also change other aspects of the
>> interface, e.g. passing a pci_host_bridge pointer plus bus number
>> instead of a pci_bus pointer, or having the callback in the
>> pci_host_bridge structure.
>
> I like this idea a lot, too.  I think the fact that
> pci_bus_read_config_word() requires a pci_bus * complicates things in
> a few places.
>
> I think it's completely separate, as you say, and we should defer it
> for now because even part a) is a lot of work.  I added it to my list
> of possible future projects.
>

What about strange PCI devices such as Non-Transparent bridges?
They will require their own PCI Config space accessors that is not
connected to a host bridge if one wants to do some sort of
punch-through enumeration.
I guess the kernel doesn't care much about them?

Best regards,
Kjetil Oftedal

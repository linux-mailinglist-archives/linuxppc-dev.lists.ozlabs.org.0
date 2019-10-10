Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F3AD0D343A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Oct 2019 01:19:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46q6Tv3bTXzDqSS
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Oct 2019 10:18:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::b43; helo=mail-yb1-xb43.google.com;
 envelope-from=carlojpisani@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="eVz4uwN6"; 
 dkim-atps=neutral
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com
 [IPv6:2607:f8b0:4864:20::b43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46q2Rj025zzDqRF
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2019 07:16:45 +1100 (AEDT)
Received: by mail-yb1-xb43.google.com with SMTP id q143so2354164ybg.12
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2019 13:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MLMwabB3+kykUPlj4jwFPRNN9g+7Qjcts+1oVZQGP5I=;
 b=eVz4uwN6L4dlHnUbeDQytnIklKCYBFfhG/Zy9JsZAQBI1p0jIq0WSUytwJJlVbxGRF
 XybqcC5miLvyo9M7y28N7S1cKDjsdlH8fHwHmEeQIvNKNYO6OuZMSHv/1nFAkhG8/aOP
 7/+p+wL1oHoUS9nTHTXESUqaddpYHvpM/sMhkGdgs/C9jpN/yuxybF5MT5Jza0sdMicO
 YlKgsAIoyoBuZwEkQoCccV4WE8jdMmvadeaHjqPL6w0E59TB8TIy5IRKqeDfwohYYB/n
 AzQokFhzDGo536XFMrcvWXPLXMYBv2q8Q/WVbJK7m/2L9OwIxXKlNR6zLgPto+YbWXs9
 u6sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MLMwabB3+kykUPlj4jwFPRNN9g+7Qjcts+1oVZQGP5I=;
 b=Zno1rvfes4V/Bj/tn/kbYerrcQ6vKnDHgemEgGlXCn4XeLSl3aRBKSEMGbI8nPY9AP
 PwZLInnPdPetQaOzD2mBYPnjYH6ZqzRuy/2SULDPqGyERStuVmp1b9zFUgvJ4cRKc4T/
 Se5AtdCmTb4AsXoNqsXXEwGHPGM/N/u1wdzDwI95priIjOYXQ0xagkcLzElMUHThXUVV
 XPe+W1E+XZ0Wn8hCQQxGfJsc8cvppzqQMBbgYS4WgssZX0xruisFEd+5lGNwJdRUZqbd
 Ng/xbW5CXEgYYtrUPi73yFqOsS3be88m1csZ8YSM34zHQYM/uqiMSUNYOG2pzu/QiVqi
 r97Q==
X-Gm-Message-State: APjAAAU+V7SeCOFGBWKzYpwe+RBcoBdKyNdInmWR4eBh5Rr7OXfetV+o
 WR13rVGMKehDetT8nO224RAD5v68a2F4NM8mkhTIisym
X-Google-Smtp-Source: APXvYqw45WqLwJrlA9w4vRZEoPfpmGaWyJjZCcGQsGhxt43neVBftJ2Br3H3WUvylDOh7nKkh+WLs6EaxXbtb3yU2fc=
X-Received: by 2002:a25:8309:: with SMTP id s9mr368139ybk.34.1570738600160;
 Thu, 10 Oct 2019 13:16:40 -0700 (PDT)
MIME-Version: 1.0
References: <1569910334-5972-1-git-send-email-tyreld@linux.ibm.com>
 <1569910334-5972-3-git-send-email-tyreld@linux.ibm.com>
 <87y2xsifqc.fsf@linux.ibm.com>
In-Reply-To: <87y2xsifqc.fsf@linux.ibm.com>
From: Carlo Pisani <carlojpisani@gmail.com>
Date: Thu, 10 Oct 2019 22:16:30 +0200
Message-ID: <CA+QBN9Ae1aB-F0MBFF_5xWO=NLT9exG-2X+xS2RKXepKcHYRTg@mail.gmail.com>
Subject: powerpc/405GP, cuImage and PCI support
To: linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 11 Oct 2019 10:17:08 +1100
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
Cc: bhelgaas@google.com, Tyrel Datwyler <tyreld@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

hi
I wrote here (1) a couple of years ago, I am still working with kernel
4.11.0 and there is broken support for initializing the PCI.

arch/powerpc/book/cuimage-walnut.c requires "/plb" compatible with
"fsl,pq2-localbus", while the device-tree file (walnut.dts) defines
"/plb" compatible with "ibm,plb3"

I am not an expert, but "fsl,pq2-localbus" != "ibm,plb3"

Therefore the PCI initialization of the PPC405GP seems wrong and every
kernel >= 2.6.26 is not able to correctly address the PDC20265

(1) https://bugzilla.kernel.org/show_bug.cgi?id=195933

an interesting not is:
kernel 2.6.26 can be compiled with arch=ppc and arch=powerpc

with arch=ppc the promise PDC20265 chip is correctly managed
with arch=powerpc the PDC20265 is not correctly managed


any idea? help? suggestion?

thanks
Carlo


--------------------------------------------------------------------------------------
    bus_node = finddevice("/plb");
    if (!bus_node)
    {
        notify_error(module, id, "device /plb not found");
        return;
    }
    if (!dt_is_compatible(bus_node, "fsl,pq2-localbus"))
    {
        notify_warn(module, id, "device fsl,pq2-localbus");
        notify_error(module, id, "device /plb is not compatible");
--------------------------------------------------------------------------------------
plb
        {
                /*
                 * Processor Local Bus (PLB)
                 */
                compatible = "ibm,plb3";
--------------------------------------------------------------------------------------


ide0 at 0x1f0-0x1f7,0x3f6 on irq 31
ide1 at 0x170-0x177,0x376 on irq 31

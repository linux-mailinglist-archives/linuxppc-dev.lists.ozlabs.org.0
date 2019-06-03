Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F150339DC
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jun 2019 23:09:26 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Hnjv0CpTzDqXD
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2019 07:09:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::443; helo=mail-pf1-x443.google.com;
 envelope-from=ndesaulniers@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="lWohiKBq"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45HnhY3W6bzDqMx
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jun 2019 07:08:07 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id c6so11303544pfa.10
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 Jun 2019 14:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jsqt76+/tC7lNIGkBOfSxOR0w7kTsY9VRuEizjLylaM=;
 b=lWohiKBqCPBenj/eJUzVHOJpCdAi91g5TtT2pyrV0FfesO2LcED3e8srNOon8Iibg8
 XtIVB4yvu8opanO7FhZdkXkw4qrcWHepKTZehjxMhdJDV96SRObFjXSOJ7rGU53BIOCP
 amFtVM8IVZTgsTynPUL6wWPlqXYRwRZZzxCbIY9Ee0e3Vl33p4qUyAVxj8FpxZ60liZ+
 tlqBRl6mtiIkFKWFCab1uDZBalnO4+vn2OxS13m7xXU6v0FU5TV28RkCj9ovOInxVDww
 AAHmWcMNk0lFA89DRsCsZY4WJwkQ6CMV6qh3KnKzsG3YvEUYZUc8GLtbMBr5SeewywTj
 cL0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jsqt76+/tC7lNIGkBOfSxOR0w7kTsY9VRuEizjLylaM=;
 b=X4nymbOKT3NzPZSkYNjZcMO1aHZbYgszV/Cvo/dGYEZATCCLpuwfHucVW18NLsdtDb
 IWbdgaeTPN4euTOqzZV3e+/gMdpZyRBlyHaSmed3xakzgAq3Q/jv32raxW+4XoofAw3f
 RvOii5GF1iPpDwng06OOO+d6giZLZ3IFeXOAoUisiXf8XxnAd+I1on65OSqn5pzkCn0k
 LB/pA6765UyAMVeJRsDgpqC5+Ox+JkORqDXbFpAdBhdhnvAGpUR7AvtQfZrQi30IXJso
 xw+f4mJpONH72RkxDMNZsMqrk8K51dAsnC/+70lDlVx4LDyIqE7B/SPe8A4KdpbbE0Qe
 JItA==
X-Gm-Message-State: APjAAAUe6HgDt1lPTX41Ey/pPoDwPsjyWKKXjfIvFHcyxNNizF/Klqd5
 QfxEVjWkemKxHDV7XCFgBQJZiLYBobvvJnuzYWB1lw==
X-Google-Smtp-Source: APXvYqwtRDahz95jt5ckTsuH+i7KTn9MRTd6CF+6hpsuPoa7lkdPVCsC5gUhiu+y1T7oPa6/2fCZnPaB/OkOvv8EDa4=
X-Received: by 2002:a17:90a:bf02:: with SMTP id
 c2mr5763850pjs.73.1559596083400; 
 Mon, 03 Jun 2019 14:08:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190603174323.48251-1-natechancellor@gmail.com>
In-Reply-To: <20190603174323.48251-1-natechancellor@gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 3 Jun 2019 14:07:50 -0700
Message-ID: <CAKwvOdkQzdZezwf51UddFVGQh0mRFMEexr1cMHx=va88T515YQ@mail.gmail.com>
Subject: Re: [PATCH] PCI: rpaphp: Avoid a sometimes-uninitialized warning
To: Nathan Chancellor <natechancellor@gmail.com>
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, LKML <linux-kernel@vger.kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Paul Mackerras <paulus@samba.org>, linux-pci@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 3, 2019 at 10:44 AM Nathan Chancellor
<natechancellor@gmail.com> wrote:
> Looking at the loop in a vacuum as clang would, fndit could be
> uninitialized if entries was ever zero or the if statement was
> always true within the loop. Regardless of whether or not this
> warning is a problem in practice, "found" variables should always
> be initialized to false so that there is no possibility of
> undefined behavior.

Thanks for the patch Nathan.  fndit isn't really being used for
anything other than a print statement outside of the loop.  How about:

```
diff --git a/drivers/pci/hotplug/rpaphp_core.c
b/drivers/pci/hotplug/rpaphp_core.c
index bcd5d357ca23..c3899ee1db99 100644
--- a/drivers/pci/hotplug/rpaphp_core.c
+++ b/drivers/pci/hotplug/rpaphp_core.c
@@ -230,7 +230,7 @@ static int rpaphp_check_drc_props_v2(struct
device_node *dn, char *drc_name,
  struct of_drc_info drc;
  const __be32 *value;
  char cell_drc_name[MAX_DRC_NAME_LEN];
- int j, fndit;
+ int j;

  info = of_find_property(dn->parent, "ibm,drc-info", NULL);
  if (info == NULL)
@@ -245,17 +245,13 @@ static int rpaphp_check_drc_props_v2(struct
device_node *dn, char *drc_name,

  /* Should now know end of current entry */

- if (my_index > drc.last_drc_index)
- continue;
-
- fndit = 1;
- break;
+ /* Found it */
+ if (my_index <= drc.last_drc_index) {
+ sprintf(cell_drc_name, "%s%d", drc.drc_name_prefix,
+ my_index);
+ break;
+ }
  }
- /* Found it */
-
- if (fndit)
- sprintf(cell_drc_name, "%s%d", drc.drc_name_prefix,
- my_index);

  if (((drc_name == NULL) ||
       (drc_name && !strcmp(drc_name, cell_drc_name))) &&
```
(not sure my tabs were pasted properly in the above...)

-- 
Thanks,
~Nick Desaulniers

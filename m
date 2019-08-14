Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 16AD38D98F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2019 19:09:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 467x066h9LzDqtp
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Aug 2019 03:09:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.214.193; helo=mail-pl1-f193.google.com;
 envelope-from=bart.vanassche@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=acm.org
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 467wv52jsxzDqr5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Aug 2019 03:05:17 +1000 (AEST)
Received: by mail-pl1-f193.google.com with SMTP id y1so584800plp.9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2019 10:05:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GTqeZQuB5IgM+FmX9PwW5NoGtvVH2NCZhDAITGesyDI=;
 b=A+ZZ6/MZjgw7DaPtifxeYsuM6CNnQBrU1S5IlnWOUD0NRhqYuHrR2g3M5+03iLlTXk
 TntxdYsy+tftwsE4+uByLAsFylzuhAKMg4oURFpmk8TbcsZcg8Ug5svpetbfzBsevCnK
 v/CXGj9BA4occ8zpSacgO2Ks/3UlLbM4ESi/um61YH7B6XbIDVwM492YaOesvYSzpl7K
 WU2vUInB4Hqmmj/oHgpRpxkxFr9koqn/E1h4jPJlJjWIwmZTtMWBfb5tKlXD9FqBNlyy
 1f3m2VjxmOpnTLvQx/ZSWnMnJnkXIw8+57GaGXo70F75oeWy6aby1rSdjfC/F8jqharl
 mx2w==
X-Gm-Message-State: APjAAAVfbxxs5sUCo+vdY92+BqYUvZm1VfibqA7/oxAr4a27p6yWEOFo
 VFnXKM2ma3IsqNNGQDj8WDA=
X-Google-Smtp-Source: APXvYqyY7dMRw94QInx53Q43ZHoQCxgqlpv6Xz4f7o17+uQhWoBsE2UtI2jpEFYNuEjRmoBdpNZKug==
X-Received: by 2002:a17:902:8345:: with SMTP id z5mr406730pln.29.1565802314643; 
 Wed, 14 Aug 2019 10:05:14 -0700 (PDT)
Received: from ?IPv6:2620:15c:2c1:200:fb9c:664d:d2ad:c9b5?
 ([2620:15c:2c1:200:fb9c:664d:d2ad:c9b5])
 by smtp.gmail.com with ESMTPSA id c70sm359640pfb.163.2019.08.14.10.05.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Aug 2019 10:05:13 -0700 (PDT)
Subject: Re: [5.3.0-rc4-next][bisected 882632][qla2xxx] WARNING: CPU: 10 PID:
 425 at drivers/scsi/qla2xxx/qla_isr.c:2784 qla2x00_status_entry.isra
To: Abdul Haleem <abdhalee@linux.vnet.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
References: <1565801523.6908.6.camel@abdul>
From: Bart Van Assche <bvanassche@acm.org>
Message-ID: <cafb1d40-a11e-c137-db06-4564e5f5caf5@acm.org>
Date: Wed, 14 Aug 2019 10:05:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1565801523.6908.6.camel@abdul>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: sachinp <sachinp@linux.vnet.ibm.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 linux-scsi <linux-scsi@vger.kernel.org>, martin.petersen@oracle.com,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-next <linux-next@vger.kernel.org>,
 Himanshu Madhani <hmadhani@marvell.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 8/14/19 9:52 AM, Abdul Haleem wrote:
> Greeting's
>=20
> Today's linux-next kernel (5.3.0-rc4-next-20190813)  booted with warnin=
g on my powerpc power 8 lpar
>=20
> The WARN_ON_ONCE() was introduced by commit 88263208 (scsi: qla2xxx: Co=
mplain if sp->done() is not...)
>=20
> boot logs:
>=20
> WARNING: CPU: 10 PID: 425 at drivers/scsi/qla2xxx/qla_isr.c:2784

Hi Abdul,

Thank you for having reported this. Is that the only warning reported on =
your setup by the qla2xxx
driver? If that warning is commented out, does the qla2xxx driver work as=
 expected?

Thanks,

Bart.


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 061DA3430AD
	for <lists+linuxppc-dev@lfdr.de>; Sun, 21 Mar 2021 03:48:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F32BZ3RvZz3002
	for <lists+linuxppc-dev@lfdr.de>; Sun, 21 Mar 2021 13:48:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=hmBFTr1i;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::530;
 helo=mail-ed1-x530.google.com; envelope-from=lee.jones@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=hmBFTr1i; dkim-atps=neutral
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F1xQb1hrnz3brK
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Mar 2021 19:10:12 +1100 (AEDT)
Received: by mail-ed1-x530.google.com with SMTP id e7so9675441edu.10
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Mar 2021 01:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=XgtABA/PScHZGookhQ2E5pGm9lq0LjK98naHGxTSbN8=;
 b=hmBFTr1ieWWvj9bJquI4yZ4G5aN2xAwvvT3hFBQq5kMEruiYFIVUIF8TDkrOflqbY/
 hff7nM7Ed9JBVGI+0ChwJZeE+u5ZuNH5nEuQZ+AwlVDtUS+6RuHtQEmPQXxPFVlUJo6Y
 gQ6ZkTuay0ZHuhDYIhKv13j3PfhZOATtVmMfJ+OnabVag6jzLurBkr+5vLiss3ZBHXwd
 PlIlaNgk1rByI27FN5D+lCndbTAQGD94OjzJqm7TEL3QedanK12tr7lkJ3ZH3u80V4RC
 jY3DHUNWLSgS/IxWrnqbk9CIR8GDa/BmC7SiCuuUCh9o6W0gYrtG8jcsGt09qr4EtKMI
 Ba+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=XgtABA/PScHZGookhQ2E5pGm9lq0LjK98naHGxTSbN8=;
 b=kIRhfVghyOaNRrmFr2JX8l/cVNnjx5X+2b/B2CqI98M1Vo1lhPuE0ATVcsftctwb7Z
 ov3602XOhaRyctUJaZMcmXuVidOeul8YrCBc/oJ5qBIib63VzmRshUG7JANswdxBjiiZ
 2SXTLCBJOG+HBNkKXFRpsqWlXIUz11cQ74lbyItLGtiWgARZ6TXPf8VRRGhU7Vka+M7t
 vR5zu/eyVNOyP1JkwzMl2a1oWG5UwCH3qHzC5oqScfq/+kK9Dn1fEqMe9mu9X/khyCld
 vz4deXqlB9Y7BgoIEN8+3+pz8zv7K5hrcNV/MFc4xhFsvkeDSBVQC/qgmhMTgGuZheFJ
 C1wA==
X-Gm-Message-State: AOAM533i0aJQh1vQP9KX4Ls13/xDLkmM5eoG2gMkjeR/h5QjF4wi6SFm
 RnrJuBwuFiWSMN1ft8psyIjytg==
X-Google-Smtp-Source: ABdhPJym1mhN5RQZ++Hm6Gazh+NWc10OyinKc4o0Sv9gWUyUob63YXlK9gxpT3ahmvMtfj5IGFkAgw==
X-Received: by 2002:a05:6402:cb8:: with SMTP id
 cn24mr8250200edb.105.1616141407037; 
 Fri, 19 Mar 2021 01:10:07 -0700 (PDT)
Received: from dell ([91.110.221.194])
 by smtp.gmail.com with ESMTPSA id cw14sm3704018edb.8.2021.03.19.01.10.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 01:10:06 -0700 (PDT)
Date: Fri, 19 Mar 2021 08:10:03 +0000
From: Lee Jones <lee.jones@linaro.org>
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Subject: Re: [PATCH 00/36] [Set 4] Rid W=1 warnings in SCSI
Message-ID: <20210319081003.GF2916463@dell>
References: <20210317091230.2912389-1-lee.jones@linaro.org>
 <yq1zgyzolqx.fsf@ca-mkp.ca.oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <yq1zgyzolqx.fsf@ca-mkp.ca.oracle.com>
X-Mailman-Approved-At: Sun, 21 Mar 2021 13:48:15 +1100
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
Cc: Uma Krishnan <ukrishn@linux.ibm.com>,
 Brian Macy <bmacy@sunshinecomputing.com>, Hannes Reinecke <hare@kernel.org>,
 Anil Ravindranath <anil_ravindranath@pmc-sierra.com>,
 Tyrel Datwyler <tyreld@linux.ibm.com>, willy@debian.org,
 Le Moal <damien.lemoal@hgst.com>, Dave Boutcher <sleddog@us.ibm.com>,
 Marvell <jyli@marvell.com>, Jirka Hanika <geo@ff.cuni.cz>,
 Linda Xie <lxie@us.ibm.com>, "C.L. Huang" <ching@tekram.com.tw>,
 target-devel@vger.kernel.org, Drew Eckhardt <drew@colorado.edu>,
 Brian King <brking@linux.vnet.ibm.com>, Christoph Hellwig <hch@lst.de>,
 Alan Cox <alan@lxorguk.ukuu.org.uk>, linux-drivers@broadcom.com,
 "Nicholas A. Bellinger" <nab@kernel.org>, Linux GmbH <hare@suse.com>,
 linux-scsi@vger.kernel.org, Shaun Tancheff <shaun.tancheff@seagate.com>,
 Subbu Seetharaman <subbu.seetharaman@broadcom.com>,
 Sathya Prakash <sathya.prakash@broadcom.com>,
 Doug Ledford <dledford@redhat.com>, "Leonard N. Zubkoff" <lnz@dandelion.com>,
 Ketan Mukadam <ketan.mukadam@broadcom.com>,
 Dave Boutcher <boutcher@us.ibm.com>, Colin DeVilbiss <devilbis@us.ibm.com>,
 Karan Tilak Kumar <kartilak@cisco.com>, Badari Pulavarty <pbadari@us.ibm.com>,
 "Bryant G. Ly" <bryantly@linux.vnet.ibm.com>,
 Douglas Gilbert <dgilbert@interlog.com>, Jamie Lenehan <lenehan@twibble.org>,
 MPT-FusionLinux.pdl@avagotech.com, Richard Gooch <rgooch@atnf.csiro.au>,
 MPT-FusionLinux.pdl@broadcom.com, Bas Vermeulen <bvermeul@blackstar.xs4all.nl>,
 Artur Paszkiewicz <artur.paszkiewicz@intel.com>,
 Michael Cyr <mikecyr@linux.ibm.com>, dc395x@twibble.org,
 Satish Kharat <satishkh@cisco.com>,
 Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Luben Tuikov <luben_tuikov@adaptec.com>, Ali Akcaagac <aliakc@web.de>,
 Kurt Garloff <garloff@suse.de>,
 Jitendra Bhivare <jitendra.bhivare@broadcom.com>,
 Brian King <brking@us.ibm.com>, Hannes Reinecke <hare@suse.de>,
 Erich Chen <erich@tekram.com.tw>, David Chaw <david_chaw@adaptec.com>,
 Santiago Leon <santil@us.ibm.com>, "Matthew R. Ochs" <mrochs@linux.ibm.com>,
 "Manoj N. Kumar" <manoj@linux.ibm.com>,
 Sreekanth Reddy <sreekanth.reddy@broadcom.com>,
 Eric Youngdale <eric@andante.org>, Oliver Neukum <oliver@neukum.org>,
 linux-kernel@vger.kernel.org, Sesidhar Baddela <sebaddel@cisco.com>,
 Alex Davis <letmein@erols.com>, Torben Mathiasen <tmm@image.dk>,
 Paul Mackerras <paulus@samba.org>, FUJITA Tomonori <tomof@acm.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 18 Mar 2021, Martin K. Petersen wrote:

> 
> Lee,
> 
> > This set is part of a larger effort attempting to clean-up W=1 kernel
> > builds, which are currently overwhelmingly riddled with niggly little
> > warnings.
> 
> Applied to 5.13/scsi-staging, thanks! I fixed a few little things.

Thanks for your continued support Martin.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog

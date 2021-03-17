Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B65F533ED8B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Mar 2021 10:55:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F0ls55nDvz30CM
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Mar 2021 20:55:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=qEkvvGwq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::432;
 helo=mail-wr1-x432.google.com; envelope-from=lee.jones@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=qEkvvGwq; dkim-atps=neutral
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F0kvk1Zkcz2yYd
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Mar 2021 20:12:46 +1100 (AEDT)
Received: by mail-wr1-x432.google.com with SMTP id e9so995523wrw.10
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Mar 2021 02:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ISKg/iwBQz7CPlp+U8011svc51lofKx9uSYbTL21B/U=;
 b=qEkvvGwq4ou+j09IT2hRU/qvUjgSWSCOe45KQqgVsEthhPy9Sa3JKnnpMaJKLxbwke
 JLLENYkkuWjOCKr2EpZh+HVJdlDZ0aHzbAGNBzDLhHgY12utiYihaBb2bJMbRzjk/ENi
 uKt/bU0qe+GrSCUiT9Gqp2X3A4aGkSFxYrAoicGWu7ijzCzI3hm88mzExqtp7vPdemUM
 BqJ6S2OcEeSFZ1vxEAetVqW8iigO20sW9vHAhwX97Z0vQY8bnJDn9F8O8CuCS9j45ITu
 zzKoiL2XcgLmw6hOvUmHz0PTx2Xa07kKDj4PdMG5SA1HSVDW6exvYScTKJgwWLvY1i9H
 0Aiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ISKg/iwBQz7CPlp+U8011svc51lofKx9uSYbTL21B/U=;
 b=kYCBp40PRKvlcMjbB8rHck5FzmNFnwrLYCj7Bl6I1k4v6VVn2XHS4IPVph6nfYegtQ
 3MzlJopnRDIj9th+v/Di3LVXBQGmE87EhajxgLpPRmPICK+323JOPj9nxHyUqfHzP1FF
 0VyayCaHKFBPoge8M/BY+sQILTg9MgEaiQ0GsmJEB+NKpPiOpThaI2BtQYRfDAoBkpF3
 xNaohXE3Vi904zHpbX9SXccOGTvcFPmNJH5sWGetHWagEi64FDgdPvVNdjcIzBsxagME
 2q1M1HXlLn/bw7bScjOWHSQawFutE5aPwkYrKbeKGnlWikbGymu4EUdp6TPHMY2WxCYe
 V9kw==
X-Gm-Message-State: AOAM531AFwzMEQxEvSCr9jSsVaIhEKjNADa/yjns5mPU3+1VttDQyYyN
 o4SoBlDaSUtEAv9Vnzd5mfVYRw==
X-Google-Smtp-Source: ABdhPJx4jE1xGizjBkwwSiVeurLS8NDV4il8pjxUOd25LpFWTAD2G/HRR5q/KCo4sMGl54BLhnhPXw==
X-Received: by 2002:adf:ecca:: with SMTP id s10mr3193723wro.324.1615972359524; 
 Wed, 17 Mar 2021 02:12:39 -0700 (PDT)
Received: from dell.default ([91.110.221.194])
 by smtp.gmail.com with ESMTPSA id e18sm12695886wru.73.2021.03.17.02.12.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 02:12:38 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 00/36] [Set 4] Rid W=1 warnings in SCSI
Date: Wed, 17 Mar 2021 09:11:54 +0000
Message-Id: <20210317091230.2912389-1-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 17 Mar 2021 20:55:14 +1100
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
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Eric Youngdale <eric@andante.org>, Oliver Neukum <oliver@neukum.org>,
 linux-kernel@vger.kernel.org, Sesidhar Baddela <sebaddel@cisco.com>,
 Alex Davis <letmein@erols.com>, Torben Mathiasen <tmm@image.dk>,
 Paul Mackerras <paulus@samba.org>, FUJITA Tomonori <tomof@acm.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This set is part of a larger effort attempting to clean-up W=1
kernel builds, which are currently overwhelmingly riddled with
niggly little warnings.

Lee Jones (36):
  scsi: myrb: Demote non-conformant kernel-doc headers and fix others
  scsi: ipr: Fix incorrect function names in their headers
  scsi: mvumi: Fix formatting and doc-rot issues
  scsi: sd_zbc: Place function name into header
  scsi: pmcraid: Fix a whole host of kernel-doc issues
  scsi: sd: Fix function name in header
  scsi: aic94xx: aic94xx_dump: Correct misspelling of function
    asd_dump_seq_state()
  scsi: be2iscsi: be_main: Ensure function follows directly after its
    header
  scsi: dc395x: Fix some function param descriptions
  scsi: initio: Fix a few kernel-doc misdemeanours
  scsi: a100u2w: Fix some misnaming and formatting issues
  scsi: myrs: Add missing ':' to make the kernel-doc checker happy
  scsi: pmcraid: Correct function name pmcraid_show_adapter_id() in
    header
  scsi: mpt3sas: mpt3sas_scs: Fix a few kernel-doc issues
  scsi: be2iscsi: be_main: Demote incomplete/non-conformant kernel-doc
    header
  scsi: isci: phy: Fix a few different kernel-doc related issues
  scsi: fnic: fnic_scsi: Demote non-conformant kernel-doc headers
  scsi: fnic: fnic_fcs: Kernel-doc headers must contain the function
    name
  scsi: isci: phy: Provide function name and demote non-conforming
    header
  scsi: isci: request: Fix a myriad of kernel-doc issues
  scsi: isci: host: Fix bunch of kernel-doc related issues
  scsi: isci: task: Demote non-conformant header and remove superfluous
    param
  scsi: isci: remote_node_table: Fix a bunch of kernel-doc misdemeanours
  scsi: isci: remote_node_context: Fix one function header and demote a
    couple more
  scsi: isci: port_config: Fix a bunch of doc-rot and demote abuses
  scsi: isci: remote_device: Fix a bunch of doc-rot issues
  scsi: isci: request: Fix doc-rot issue relating to 'ireq' param
  scsi: isci: port: Fix a bunch of kernel-doc issues
  scsi: isci: remote_node_context: Demote kernel-doc abuse
  scsi: isci: remote_node_table: Provide some missing params and remove
    others
  scsi: cxlflash: main: Fix a little do-rot
  scsi: cxlflash: superpipe: Fix a few misnaming issues
  scsi: ibmvscsi: Fix a bunch of kernel-doc related issues
  scsi: ibmvscsi: ibmvfc: Fix a bunch of misdocumentation
  scsi: ibmvscsi_tgt: ibmvscsi_tgt: Remove duplicate section 'NOTE'
  scsi: cxlflash: vlun: Fix some misnaming related doc-rot

 drivers/scsi/a100u2w.c                   |  8 +--
 drivers/scsi/aic94xx/aic94xx_dump.c      |  2 +-
 drivers/scsi/be2iscsi/be_main.c          |  5 +-
 drivers/scsi/cxlflash/main.c             |  8 +--
 drivers/scsi/cxlflash/superpipe.c        |  6 +-
 drivers/scsi/cxlflash/vlun.c             |  8 +--
 drivers/scsi/dc395x.c                    |  3 +-
 drivers/scsi/fnic/fnic_fcs.c             |  2 +-
 drivers/scsi/fnic/fnic_scsi.c            |  6 +-
 drivers/scsi/ibmvscsi/ibmvfc.c           | 29 ++++++----
 drivers/scsi/ibmvscsi/ibmvscsi.c         | 70 ++++++++++++------------
 drivers/scsi/ibmvscsi_tgt/ibmvscsi_tgt.c |  8 +--
 drivers/scsi/initio.c                    | 13 ++---
 drivers/scsi/ipr.c                       |  8 +--
 drivers/scsi/isci/host.c                 | 37 ++++++-------
 drivers/scsi/isci/phy.c                  | 34 ++++++------
 drivers/scsi/isci/port.c                 | 58 ++++++++++----------
 drivers/scsi/isci/port_config.c          | 37 +++++++------
 drivers/scsi/isci/remote_device.c        | 31 ++++++-----
 drivers/scsi/isci/remote_node_context.c  | 13 +----
 drivers/scsi/isci/remote_node_table.c    | 64 +++++++++++-----------
 drivers/scsi/isci/request.c              | 60 ++++++++++----------
 drivers/scsi/isci/task.c                 |  3 +-
 drivers/scsi/mpt3sas/mpt3sas_scsih.c     | 18 +++---
 drivers/scsi/mvumi.c                     |  5 +-
 drivers/scsi/myrb.c                      | 47 ++++++++--------
 drivers/scsi/myrs.c                      |  6 +-
 drivers/scsi/pmcraid.c                   | 70 ++++++++++++------------
 drivers/scsi/sd.c                        |  2 +-
 drivers/scsi/sd_zbc.c                    |  2 +-
 30 files changed, 329 insertions(+), 334 deletions(-)

Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: Alex Davis <letmein@erols.com>
Cc: Ali Akcaagac <aliakc@web.de>
Cc: Anil Ravindranath <anil_ravindranath@pmc-sierra.com>
Cc: Artur Paszkiewicz <artur.paszkiewicz@intel.com>
Cc: Badari Pulavarty <pbadari@us.ibm.com>
Cc: Bas Vermeulen <bvermeul@blackstar.xs4all.nl>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Brian King <brking@linux.vnet.ibm.com>
Cc: Brian King <brking@us.ibm.com>
Cc: Brian Macy <bmacy@sunshinecomputing.com>
Cc: "Bryant G. Ly" <bryantly@linux.vnet.ibm.com>
Cc: Christoph Hellwig <hch@lst.de>
Cc: "C.L. Huang" <ching@tekram.com.tw>
Cc: Colin DeVilbiss <devilbis@us.ibm.com>
Cc: Dave Boutcher <boutcher@us.ibm.com>
Cc: Dave Boutcher <sleddog@us.ibm.com>
Cc: David Chaw <david_chaw@adaptec.com>
Cc: dc395x@twibble.org
Cc: Douglas Gilbert <dgilbert@interlog.com>
Cc: Doug Ledford <dledford@redhat.com>
Cc: Drew Eckhardt <drew@colorado.edu>
Cc: Erich Chen <erich@tekram.com.tw>
Cc: Eric Youngdale <eric@andante.org>
Cc: FUJITA Tomonori <tomof@acm.org>
Cc: Hannes Reinecke <hare@kernel.org>
Cc: Hannes Reinecke <hare@suse.de>
Cc: "James E.J. Bottomley" <jejb@linux.ibm.com>
Cc: Jamie Lenehan <lenehan@twibble.org>
Cc: Jirka Hanika <geo@ff.cuni.cz>
Cc: Jitendra Bhivare <jitendra.bhivare@broadcom.com>
Cc: Karan Tilak Kumar <kartilak@cisco.com>
Cc: Ketan Mukadam <ketan.mukadam@broadcom.com>
Cc: Kurt Garloff <garloff@suse.de>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Le Moal <damien.lemoal@hgst.com>
Cc: "Leonard N. Zubkoff" <lnz@dandelion.com>
Cc: Linda Xie <lxie@us.ibm.com>
Cc: linux-drivers@broadcom.com
Cc: Linux GmbH <hare@suse.com>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-scsi@vger.kernel.org
Cc: Luben Tuikov <luben_tuikov@adaptec.com>
Cc: "Manoj N. Kumar" <manoj@linux.ibm.com>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Marvell <jyli@marvell.com>
Cc: "Matthew R. Ochs" <mrochs@linux.ibm.com>
Cc: Michael Cyr <mikecyr@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: MPT-FusionLinux.pdl@avagotech.com
Cc: MPT-FusionLinux.pdl@broadcom.com
Cc: "Nicholas A. Bellinger" <nab@kernel.org>
Cc: Oliver Neukum <oliver@neukum.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Richard Gooch <rgooch@atnf.csiro.au>
Cc: Santiago Leon <santil@us.ibm.com>
Cc: Sathya Prakash <sathya.prakash@broadcom.com>
Cc: Satish Kharat <satishkh@cisco.com>
Cc: Sesidhar Baddela <sebaddel@cisco.com>
Cc: Shaun Tancheff <shaun.tancheff@seagate.com>
Cc: Sreekanth Reddy <sreekanth.reddy@broadcom.com>
Cc: Subbu Seetharaman <subbu.seetharaman@broadcom.com>
Cc: Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com>
Cc: target-devel@vger.kernel.org
Cc: Torben Mathiasen <tmm@image.dk>
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>
Cc: Uma Krishnan <ukrishn@linux.ibm.com>
Cc: willy@debian.org
-- 
2.27.0


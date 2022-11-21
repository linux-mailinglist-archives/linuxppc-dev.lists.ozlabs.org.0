Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F4363216C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Nov 2022 12:55:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NG5ST63JTz3dvQ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Nov 2022 22:55:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=nasKYIyg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::132; helo=mail-lf1-x132.google.com; envelope-from=kernelfans@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=nasKYIyg;
	dkim-atps=neutral
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NG5RW2cMSz2y35
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Nov 2022 22:55:01 +1100 (AEDT)
Received: by mail-lf1-x132.google.com with SMTP id bp15so18427441lfb.13
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Nov 2022 03:55:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=af1VZGobUWOKXyys0cwh+/X4l043mxb0kQ0938lhC9g=;
        b=nasKYIygcKtv5eHl4E69KiaF3gOw4nYBb052HsvK0RIXiwvbd+1HFswdT3ofU91EQA
         JHllsEcvzVXtuhpNOlRYSizq7U+3P115gRCDtfSVeEQaDDMyaHpt8Cw+Uve3VSEEvf+W
         l7YoYmYRksPGiL9z6QshCQHpDADAilKM2KZlfl/FHLNRSZBCIxtVaNzaveXx3w5n4hWd
         sgU1rfiMpnksDuG/PPUQLKeLD8rBxnXN4rY0YtbJK8azVrNFnRg/TGC/8JWvnWboGdRA
         gZGpXfcnAGF+SvZ4dA++OWMIYhAg/EbRqBw8E+ESa/uYkj9VGjy7Tx9QSM9Zvoz3mQ/I
         rMmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=af1VZGobUWOKXyys0cwh+/X4l043mxb0kQ0938lhC9g=;
        b=a0MN9kUU5VH4+fV8YNyDwW92cNIT9FuWGbPLkos+uha1ZNkFMyL2e1IUl0Gbyuha3j
         /p/M+K5058R9Ox4KmDFQzDg4QAuXkwOd4VxGYu2hYobUMLGOc7IjI+AluE4jU3w9NPBJ
         TNWxeNGKGFwrmatIv9ykLpzhjRridgE5MkPRK0Ru+hrflxc52MZViN93HDZMSG1ApxUy
         jon0yC0t1/hS6asCTibPdDDRQWspYF5S9q5k65Xn0WUcNwSxwYSyYUcOd9uCB4QX1awN
         KjRz0ZaaH/0o6tPZoAY/YSjSmWExKQ0whL0/kr859vRKQnvWLIXOd2JukLxocwmm173b
         5ATw==
X-Gm-Message-State: ANoB5pk/GO75E6KADauaMSzQGkBDP7aRHDm79RAsIfIBxh0caqIDVxDG
	YqttxBhSPUYP4RwgD1ijp7FjdOq6jc4xNr/55DUen5lzdIqo
X-Google-Smtp-Source: AA0mqf4e2Pk/hLwgqWs1NClFL7JxlrwUkjXAZhKBFxQU/iQc4bx1R+B8k/twHnT4tmTRit45QN0nF8M0f2ngMyygN8w=
X-Received: by 2002:ac2:41d9:0:b0:4b1:4d9f:2204 with SMTP id
 d25-20020ac241d9000000b004b14d9f2204mr5525490lfi.22.1669031697577; Mon, 21
 Nov 2022 03:54:57 -0800 (PST)
MIME-Version: 1.0
From: Pingfan Liu <kernelfans@gmail.com>
Date: Mon, 21 Nov 2022 19:54:46 +0800
Message-ID: <CAFgQCTuz3n5uNKwOOXaL9xT-ftJT0nfo4OfdNepvMGbi0Zqh7Q@mail.gmail.com>
Subject: 
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: multipart/mixed; boundary="0000000000007464f605edf9b93a"
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
Cc: Coiby Xu <coxu@redhat.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--0000000000007464f605edf9b93a
Content-Type: text/plain; charset="UTF-8"

Hello Powerpc folks,

I encounter an kdump bug, which I bisect and pin commit 174db9e7f775
("powerpc/pseries/pci: Add support of MSI domains to PHB hotplug")

In that case, using Fedora 36 as host, the mentioned commit as the
guest kernel, and virto-block disk, the kdump kernel will hang:

[    0.000000] Kernel command line: elfcorehdr=0x22c00000
no_timer_check net.ifnames=0 console=tty0 console=hvc0,115200n8
irqpoll maxcpus=1 noirqdistrib reset_devices cgroup_disable=memory
     numa=off udev.children-max=2 ehea.use_mcs=0 panic=10
kvm_cma_resv_ratio=0 transparent_hugepage=never novmcoredd
hugetlb_cma=0
    ...
    [    7.763260] virtio_blk virtio2: 32/0/0 default/read/poll queues
    [    7.771391] virtio_blk virtio2: [vda] 20971520 512-byte logical
blocks (10.7 GB/10.0 GiB)
    [   68.398234] systemd-udevd[187]: virtio2: Worker [190]
processing SEQNUM=1193 is taking a long time
    [  188.398258] systemd-udevd[187]: virtio2: Worker [190]
processing SEQNUM=1193 killed


During my test, I found that in very rare cases, the kdump can success
(I guess it may be due to the cpu id).  And if using either maxcpus=2
or using scsi-disk, then kdump can also success.  And before the
mentioned commit, kdump can also success.

The attachment contains the xml to reproduce that bug.

Do you have any ideas?

Thanks

--0000000000007464f605edf9b93a
Content-Type: text/xml; charset="US-ASCII"; name="virtblk-hang.xml"
Content-Disposition: attachment; filename="virtblk-hang.xml"
Content-Transfer-Encoding: base64
Content-ID: <f_laqq9w330>
X-Attachment-Id: f_laqq9w330

PGRvbWFpbiB0eXBlPSJrdm0iPgogIDxuYW1lPnJoZWw5PC9uYW1lPgogIDx1dWlkPjYyNjZjMWMx
LTFlNzQtNDA0Ni1iOTU5LTMzZDk0ODc3YjM4NzwvdXVpZD4KICA8bWV0YWRhdGE+CiAgICA8bGli
b3NpbmZvOmxpYm9zaW5mbyB4bWxuczpsaWJvc2luZm89Imh0dHA6Ly9saWJvc2luZm8ub3JnL3ht
bG5zL2xpYnZpcnQvZG9tYWluLzEuMCI+CiAgICAgIDxsaWJvc2luZm86b3MgaWQ9Imh0dHA6Ly9y
ZWRoYXQuY29tL3JoZWwvOC11bmtub3duIi8+CiAgICA8L2xpYm9zaW5mbzpsaWJvc2luZm8+CiAg
PC9tZXRhZGF0YT4KICA8bWVtb3J5IHVuaXQ9IktpQiI+MTY3NzcyMTY8L21lbW9yeT4KICA8Y3Vy
cmVudE1lbW9yeSB1bml0PSJLaUIiPjE2Nzc3MjE2PC9jdXJyZW50TWVtb3J5PgogIDx2Y3B1IHBs
YWNlbWVudD0ic3RhdGljIj4xNjwvdmNwdT4KICA8b3M+CiAgICA8dHlwZSBhcmNoPSJwcGM2NGxl
IiBtYWNoaW5lPSJwc2VyaWVzLXJoZWw4LjYuMCI+aHZtPC90eXBlPgogICAgPGJvb3QgZGV2PSJo
ZCIvPgogIDwvb3M+CiAgPGNwdSBtb2RlPSJjdXN0b20iIG1hdGNoPSJleGFjdCIgY2hlY2s9Im5v
bmUiPgogICAgPG1vZGVsIGZhbGxiYWNrPSJmb3JiaWQiPlBPV0VSOTwvbW9kZWw+CiAgPC9jcHU+
CiAgPGNsb2NrIG9mZnNldD0idXRjIi8+CiAgPG9uX3Bvd2Vyb2ZmPmRlc3Ryb3k8L29uX3Bvd2Vy
b2ZmPgogIDxvbl9yZWJvb3Q+cmVzdGFydDwvb25fcmVib290PgogIDxvbl9jcmFzaD5kZXN0cm95
PC9vbl9jcmFzaD4KICA8ZGV2aWNlcz4KICAgIDxlbXVsYXRvcj4vdXNyL2xpYmV4ZWMvcWVtdS1r
dm08L2VtdWxhdG9yPgogICAgPGRpc2sgdHlwZT0iZmlsZSIgZGV2aWNlPSJkaXNrIj4KICAgICAg
PGRyaXZlciBuYW1lPSJxZW11IiB0eXBlPSJxY293MiIvPgogICAgICA8c291cmNlIGZpbGU9Ii92
YXIvbGliL2xpYnZpcnQvaW1hZ2VzL3JoZWwtZ3Vlc3QtaW1hZ2UtOS4xLTIwMjIwNzAxLjAucHBj
NjRsZS5xY293MiIvPgogICAgICA8dGFyZ2V0IGRldj0idmRhIiBidXM9InZpcnRpbyIvPgogICAg
ICA8YWRkcmVzcyB0eXBlPSJwY2kiIGRvbWFpbj0iMHgwMDAwIiBidXM9IjB4MDAiIHNsb3Q9IjB4
MDQiIGZ1bmN0aW9uPSIweDAiLz4KICAgIDwvZGlzaz4KICAgIDxjb250cm9sbGVyIHR5cGU9InVz
YiIgaW5kZXg9IjAiIG1vZGVsPSJxZW11LXhoY2kiIHBvcnRzPSIxNSI+CiAgICAgIDxhZGRyZXNz
IHR5cGU9InBjaSIgZG9tYWluPSIweDAwMDAiIGJ1cz0iMHgwMCIgc2xvdD0iMHgwMiIgZnVuY3Rp
b249IjB4MCIvPgogICAgPC9jb250cm9sbGVyPgogICAgPGNvbnRyb2xsZXIgdHlwZT0icGNpIiBp
bmRleD0iMCIgbW9kZWw9InBjaS1yb290Ij4KICAgICAgPG1vZGVsIG5hbWU9InNwYXByLXBjaS1o
b3N0LWJyaWRnZSIvPgogICAgICA8dGFyZ2V0IGluZGV4PSIwIi8+CiAgICA8L2NvbnRyb2xsZXI+
CiAgICA8Y29udHJvbGxlciB0eXBlPSJ2aXJ0aW8tc2VyaWFsIiBpbmRleD0iMCI+CiAgICAgIDxh
ZGRyZXNzIHR5cGU9InBjaSIgZG9tYWluPSIweDAwMDAiIGJ1cz0iMHgwMCIgc2xvdD0iMHgwMyIg
ZnVuY3Rpb249IjB4MCIvPgogICAgPC9jb250cm9sbGVyPgogICAgPGludGVyZmFjZSB0eXBlPSJu
ZXR3b3JrIj4KCSAgICA8bWFjIGFkZHJlc3M9IjUyOjU0OjAwOjc0OmM5OjUwIi8+CgkgICAgPHNv
dXJjZSBuZXR3b3JrPSJkZWZhdWx0Ii8+CgkgICAgPG1vZGVsIHR5cGU9InZpcnRpbyIvPgoJICAg
IDxhZGRyZXNzIHR5cGU9InBjaSIgZG9tYWluPSIweDAwMDAiIGJ1cz0iMHgwMCIgc2xvdD0iMHgw
MSIgZnVuY3Rpb249IjB4MCIvPgogICAgPC9pbnRlcmZhY2U+CiAgICA8c2VyaWFsIHR5cGU9InB0
eSI+CiAgICAgIDx0YXJnZXQgdHlwZT0ic3BhcHItdmlvLXNlcmlhbCIgcG9ydD0iMCI+CiAgICAg
ICAgPG1vZGVsIG5hbWU9InNwYXByLXZ0eSIvPgogICAgICA8L3RhcmdldD4KICAgICAgPGFkZHJl
c3MgdHlwZT0ic3BhcHItdmlvIiByZWc9IjB4MzAwMDAwMDAiLz4KICAgIDwvc2VyaWFsPgogICAg
PGNvbnNvbGUgdHlwZT0icHR5Ij4KCiAgICAgIDx0YXJnZXQgdHlwZT0ic2VyaWFsIiBwb3J0PSIw
Ii8+CiAgICAgIDxhZGRyZXNzIHR5cGU9InNwYXByLXZpbyIgcmVnPSIweDMwMDAwMDAwIi8+CiAg
ICA8L2NvbnNvbGU+CiAgICA8Y2hhbm5lbCB0eXBlPSJ1bml4Ij4KICAgICAgPHRhcmdldCB0eXBl
PSJ2aXJ0aW8iIG5hbWU9Im9yZy5xZW11Lmd1ZXN0X2FnZW50LjAiLz4KICAgICAgPGFkZHJlc3Mg
dHlwZT0idmlydGlvLXNlcmlhbCIgY29udHJvbGxlcj0iMCIgYnVzPSIwIiBwb3J0PSIxIi8+CiAg
ICA8L2NoYW5uZWw+CiAgICA8aW5wdXQgdHlwZT0idGFibGV0IiBidXM9InVzYiI+CiAgICAgIDxh
ZGRyZXNzIHR5cGU9InVzYiIgYnVzPSIwIiBwb3J0PSIxIi8+CiAgICA8L2lucHV0PgogICAgPGlu
cHV0IHR5cGU9ImtleWJvYXJkIiBidXM9InVzYiI+CiAgICAgIDxhZGRyZXNzIHR5cGU9InVzYiIg
YnVzPSIwIiBwb3J0PSIyIi8+CiAgICA8L2lucHV0PgogICAgPHRwbSBtb2RlbD0idHBtLXNwYXBy
Ij4KICAgICAgPGJhY2tlbmQgdHlwZT0iZW11bGF0b3IiIHZlcnNpb249IjIuMCIvPgogICAgICA8
YWRkcmVzcyB0eXBlPSJzcGFwci12aW8iIHJlZz0iMHgwMDAwNDAwMCIvPgogICAgPC90cG0+CiAg
ICA8Z3JhcGhpY3MgdHlwZT0idm5jIiBwb3J0PSItMSIgYXV0b3BvcnQ9InllcyI+CiAgICAgIDxs
aXN0ZW4gdHlwZT0iYWRkcmVzcyIvPgogICAgPC9ncmFwaGljcz4KICAgIDxhdWRpbyBpZD0iMSIg
dHlwZT0ibm9uZSIvPgogICAgPHZpZGVvPgogICAgICA8bW9kZWwgdHlwZT0idmdhIiB2cmFtPSIx
NjM4NCIgaGVhZHM9IjEiIHByaW1hcnk9InllcyIvPgogICAgICA8YWRkcmVzcyB0eXBlPSJwY2ki
IGRvbWFpbj0iMHgwMDAwIiBidXM9IjB4MDAiIHNsb3Q9IjB4MDciIGZ1bmN0aW9uPSIweDAiLz4K
ICAgIDwvdmlkZW8+CiAgICA8bWVtYmFsbG9vbiBtb2RlbD0idmlydGlvIj4KICAgICAgPGFkZHJl
c3MgdHlwZT0icGNpIiBkb21haW49IjB4MDAwMCIgYnVzPSIweDAwIiBzbG90PSIweDA1IiBmdW5j
dGlvbj0iMHgwIi8+CiAgICA8L21lbWJhbGxvb24+CiAgICA8cm5nIG1vZGVsPSJ2aXJ0aW8iPgog
ICAgICA8YmFja2VuZCBtb2RlbD0icmFuZG9tIj4vZGV2L3VyYW5kb208L2JhY2tlbmQ+CiAgICAg
IDxhZGRyZXNzIHR5cGU9InBjaSIgZG9tYWluPSIweDAwMDAiIGJ1cz0iMHgwMCIgc2xvdD0iMHgw
NiIgZnVuY3Rpb249IjB4MCIvPgogICAgPC9ybmc+CiAgICA8cGFuaWMgbW9kZWw9InBzZXJpZXMi
Lz4KICA8L2RldmljZXM+CjwvZG9tYWluPgo=
--0000000000007464f605edf9b93a--

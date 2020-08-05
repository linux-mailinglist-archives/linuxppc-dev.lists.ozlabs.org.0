Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B512823D3AF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Aug 2020 23:53:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BMQPF5x4XzDqgx
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Aug 2020 07:53:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yahoo.com (client-ip=66.163.190.32;
 helo=sonic307-9.consmr.mail.ne1.yahoo.com; envelope-from=ecs_dn@yahoo.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256
 header.s=s2048 header.b=Ar0AGd4L; dkim-atps=neutral
Received: from sonic307-9.consmr.mail.ne1.yahoo.com
 (sonic307-9.consmr.mail.ne1.yahoo.com [66.163.190.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BMQMQ2S3CzDqd0
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Aug 2020 07:52:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1596664330; bh=IKr+A8SMCtydYzCmcfJVV74xj/D6IbcnYDNHPp3I+Ww=;
 h=Date:From:To:In-Reply-To:Subject:References:From:Subject;
 b=Ar0AGd4L44AzNJDQjHiAFN/nkoGlVJqtXHW7KFFhOYWXcI87q+D5cA9Par/iRGAIGeFETQEzFBa3n7/tfKQGYagWQUEBAx3EgRrOt6EeKBfOko+gLiorP3BX7GyA9HFO6yv5VymkgRsKpMOmGcq06AG1wWSd+Tr/sYMqFx09XAKoiB/Y86bdt+0aVi8U5eGcUfP1Ul1ReaPP4X8BfzAjppnkRKM4oevhogWQA4VNqAOefLl047GhNK1/r2+0V2hRox+cMqhUxMJB2Vkwe4YLCvpxtwTKdPcRw4DCDKCgYxZzXRhxo/qukFkn68vA3wOC26M0qXsW8ULtbNeTxZY3EA==
X-YMail-OSG: 8mrt9YEVM1l3q0B6P3BYMWhpA6EkM_qwuOeVzamd_ocXvlTDMTKGBASOeoxJQTI
 PZTqvYIMuwz8xcjfvC8fpNntwzBMyVAfjw_uLZP4u9yltYiHwMARaicAeAqQbNx2tnrNbtq4rOcI
 F4pkXeModow.u6kCLYHeq9E6EHjzjtMfVFzcyD261sZTSKWhtTR3zVtBWNp_ZT5oM1s_BdKSamHs
 4dtqUFiVehZAnfbAj7BypTkzb6TZGpoYSVSK9rUWEkAnYrdfC_KqRgjN_kddL0kKgPOpsQ4xXniz
 m.HiF_ZdLGeSCjDFpghKl5y4Y6wIpHa1SyWxa4wYHwVGT5UjYnFonipmuGcoFzwdtsmeoMInXbAF
 1kdmtK3.W.BN6Te4DOYogLuXv2MX1ytmwbBWVDoqaCu3NJn4DMRWmgkBa_OSS.g9TiyjM2uci0kX
 oqev8s5O.zpILI8TVkHNI.wrHBE3azvw.8ilzx44SyGfwY6fBuEYfF0XW3BuMxxDxclt2T1QX4If
 m9sgxgAmHhRphkst8fMx.SZLvT9EhariKpCBqJd1k7E3B2wn.8RnNDUEY2keCv749P062EJkUqVC
 sE1ejxvCohGmIvKqjSCZdDi0m5vORnN_exiBuAg0vJRLmcDMOT19rK9HB4M7k2ciybP7K.M_MjjS
 jNIJxBHlH5YMlXkJdGLJWDNvfcP4MWurCakCqphtqgdYlZ.oZnJg2yhjNzrlMbKxvHAMx3.UUjWc
 ocIDfYEtSknvXrPt.Hjys7gZk9fX9oCySWhNvfI9GVJUywl5j2AmP1sqyFpwSAv3TVYipWvld5Wz
 cMqvGHfMz0CvR0Z1xZkaKhAbzSmmL6EARxWfoI8yikiucmR2vLrLBNVKnruFus6Iui5MNMw7WJf_
 FQsZh2xVQMgcR4Py5oZ1NdwBI3LwSSjOAmM5D5ykeyKXp.QpJucyjqRrikJ5dlm_xBIWQzDrYzNe
 iq9EN42x1.tKnsW4kNopgSeC2eC.fedwts2baaPop6EJCONVAIbXnuXGD1h0XPSAj7tyD1afMdkZ
 UzW6a7ji34DkfsQOOtALaR5yyVb4xw77rdh5O29_QNnp6XJXhcpeBXVgmTABdgsFh3ucwjtFygw7
 sGYZ6mUf5NE2IWCGYAfhmt4VKVo.OsFph3.Y7AjG2F1GQuFFyo5nVd3cTQt3QuilrXYyeiSsiBEZ
 PXLDf9ERGsLCkx0BPL1k1fAzqXdKWXMHcUtYTyOTetcUUY5ueDWij1j1AEHLjzYqVEVksOVxwlK0
 JwJ0tgclfD981LQLIClOKD6cTU0RMqp54qvtmH1rgApLZ4PJZTZRNXN1afZU1EI4TH6nDAlP4Wty
 TfvhsWLnTzhRh7SjD7Sw92.ln
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic307.consmr.mail.ne1.yahoo.com with HTTP; Wed, 5 Aug 2020 21:52:10 +0000
Received: by smtp409.mail.ne1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
 ID 7d2658b8c0bb2faf86b243b1b22b29e0; 
 Wed, 05 Aug 2020 21:52:06 +0000 (UTC)
Date: Wed, 5 Aug 2020 14:52:58 -0700 (PDT)
From: thefirst ECS <ecs_dn@yahoo.com>
To: linuxppc-dev@lists.ozlabs.org
Message-ID: <32112832.26959.1596664366002.JavaMail.Dan@DanHP>
In-Reply-To: <3103222.25048.1596318084416.JavaMail.Dan@DanHP>
Subject: How would I code a Write to a proc file from within the kernel
 without reading anything from user space?
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
References: <32112832.26959.1596664366002.JavaMail.Dan.ref@DanHP>
X-Mailer: WebService/1.1.16436
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo
 Apache-HttpAsyncClient/4.1.4 (Java/11.0.7)
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In order to help debug a certain discrepancy, I need to "simulate" an "echo 1 > /proc/file" but doing it from kernel even when root file system is unavailable. 

I have simulated it just fine via call_usermodehelper (with argv etc of "echo 1 > /proc/file") from inside the kernel which triggers:
[ee897ec0] [c0122704] proc_reg_write+0x80/0xb4
[ee897ef0] [c00d3b7c] vfs_write+0xb4/0x184

just as I had wanted. But now I need to trigger the "vfs_write" and "proc_reg_write" but without using call_usermodehelper since I will be doing it when root "/" is unavailable and so I can no longer access /bin/echo and call the usermodehelper etc. So my question is how can I do that in kernel?

Not sure if I'm supposed to look in fs read_write.c and fs.h and write a method based on those or if there's some other way etc.

Thanks,
-Dan

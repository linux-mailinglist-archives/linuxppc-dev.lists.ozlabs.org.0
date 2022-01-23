Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB8249714E
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 Jan 2022 12:41:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JhWRG3ZwTz3bZ2
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 Jan 2022 22:41:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=RPz+WJkG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::a32;
 helo=mail-vk1-xa32.google.com; envelope-from=michael.heltne@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=RPz+WJkG; dkim-atps=neutral
Received: from mail-vk1-xa32.google.com (mail-vk1-xa32.google.com
 [IPv6:2607:f8b0:4864:20::a32])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JhWQZ6wSlz2yJw
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Jan 2022 22:40:52 +1100 (AEDT)
Received: by mail-vk1-xa32.google.com with SMTP id n14so8350922vkk.6
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Jan 2022 03:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=UR2PutA/Mk32cpXxf1FEEwnFGdZdXv0lk9d2O3MzX9U=;
 b=RPz+WJkGnFa+tIu0KocDsLMH3mVshC20FQqgilb2GNSP7SduFXVvAllJXQFHVCk9Gz
 SnzlpIhdj/+E+wIVhEI8e7vKouifznlblwksupn3AFNasuV1wfclJHHEPrQTV5S07pJm
 e3mlATEOaTcJSp50IIzOBk9NExepgMFz6/142xFktzUxhP8L5ODHrGeHREYDTG5WbMP/
 4YrtYckuh6DUGO2J3sgVBshmktLGSoQM0DnZonw4t5Cp+IzCLsMUebgnpuEuyEutUD8t
 KY2CtuNPxFszaK2t3i7ODfYlG4k2GKq8Tp4gQqOMQwviyDLHEM1Cy88alByh3HEHqNla
 zHLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=UR2PutA/Mk32cpXxf1FEEwnFGdZdXv0lk9d2O3MzX9U=;
 b=YX1mzyJj77Xm6pKZR/mU/5i4MAOD0Jy9YgQmjgOojuMfQAXdFLYZwIeDDmtOAErG4f
 HqLVzlidvj9BQ3j9nUgRi91+QB+4Toq2n2oEmDBLpHiWtjIr1jfJ7Pgix7dMuN3+NbWg
 GLZwIx/gtmPKigFJFiHKTWZ2OsR2grOFZLU7MisFhaPooo1CNXCERVZM4TnxOy+9I3x5
 x5pDqT7ny2KhHls1iIYE9ONlBn6OmjbrE+uoDNh6Eeuw2H4gm8Y+D5UtEuXEbuBwAHXn
 8fJeOMQXabgob/+GeG1sIfeTl4g64FtUI43TSOipRytRYPfpfBxIQ2SrwhIiTFrQkRff
 SECA==
X-Gm-Message-State: AOAM530mqdFYMub8gIREUg0oA5rnroi3Y/0LBvGEg5PYLWYjgASy2720
 U/BU3yTfouAmW905Z2Sx6bkCADIq0I7gekFXWa9T8Ryhz0uZIQ==
X-Google-Smtp-Source: ABdhPJwBsMFPLKHnRqolNhU2kuKyXDhhiQNVVNXNf1OzbOi8oPcPztD2B6WaJX8OQqpZjEFa1VXQd8ZeBAbYnLCMDAo=
X-Received: by 2002:a1f:948f:: with SMTP id w137mr4374412vkd.0.1642938048804; 
 Sun, 23 Jan 2022 03:40:48 -0800 (PST)
MIME-Version: 1.0
From: Mike <michael.heltne@gmail.com>
Date: Sun, 23 Jan 2022 14:43:22 +0100
Message-ID: <CANtoAtP2QeH+fMqHo410H=nkjRiLhYNYjhKiEpMyWRHkMGw2iA@mail.gmail.com>
Subject: [PATCH] powerpc: fix building after binutils changes.
To: "open list:LINUX FOR POWERPC..." <linuxppc-dev@lists.ozlabs.org>
Content-Type: multipart/mixed; boundary="000000000000c9965b05d63e5253"
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

--000000000000c9965b05d63e5253
Content-Type: text/plain; charset="UTF-8"

As some have probably noticed, we are seeing errors like ' Error:
unrecognized opcode: `ptesync'' 'dssall' and 'stbcix' as a result of
binutils changes, making compiling all that more fun again. The only
question on my mind still is this:
----
diff --git a/arch/powerpc/include/asm/io.h b/arch/powerpc/include/asm/io.h
index beba4979bff939..d3a9c91cd06a8b 100644
--- a/arch/powerpc/include/asm/io.h
+++ b/arch/powerpc/include/asm/io.h
@@ -334,7 +334,7 @@ static inline void __raw_writel(unsigned int v,
volatile void __iomem *addr)
 }
 #define __raw_writel __raw_writel

-#ifdef __powerpc64__
+#ifdef CONFIG_PPC64
 static inline unsigned long __raw_readq(const volatile void __iomem *addr)
 {
  return *(volatile unsigned long __force *)PCI_FIX_ADDR(addr);
@@ -352,7 +352,8 @@ static inline void __raw_writeq_be(unsigned long
v, volatile void __iomem *addr)
  __raw_writeq((__force unsigned long)cpu_to_be64(v), addr);
 }
 #define __raw_writeq_be __raw_writeq_be
-
+#endif
+#ifdef CONFIG_POWER6_CPU
 /*
  * Real mode versions of the above. Those instructions are only supposed
  * to be used in hypervisor real mode as per the architecture spec.
@@ -417,7 +418,7 @@ static inline u64 __raw_rm_readq(volatile void
__iomem *paddr)
      : "=r" (ret) : "r" (paddr) : "memory");
  return ret;
 }
-#endif /* __powerpc64__ */

+#endif /* CONFIG_POWER6_CPU */

---
Will there come a mail saying this broke the PPC6'ish based CPU
someone made in their garage? And lwesync is a valid PPC32
instruction, should i just follow the example above where
BARRIER_LWESYNC is PPC64 only?

https://github.com/threader/linux/commits/master-build-ppc - linux-next

Best regards.
Michael Heltne

--000000000000c9965b05d63e5253
Content-Type: text/x-patch; charset="US-ASCII"; name="threader_ppc_build-0.patch"
Content-Disposition: attachment; filename="threader_ppc_build-0.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_kyrb5bu40>
X-Attachment-Id: f_kyrb5bu40

RnJvbSAyMjZlZmEwNTczMzQ1N2JiNWM0ODNmMzBhYWI2ZDVjNmEzMDQ0MjJjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiB0aHJlYWRlciA8bWljaGFlbC5oZWx0bmVAZ21haWwuY29tPgpE
YXRlOiBTdW4sIDIzIEphbiAyMDIyIDE0OjE3OjEwICswMTAwClN1YmplY3Q6IFtQQVRDSF0gYXJj
aDogcG93ZXJwYzogZml4IGJ1aWxkaW5nIGFmdGVyIGJpbnV0aWxzIGNoYW5nZXMuICdkc3NhbGwn
CiBpbiBtbXVfY29udGV4dC5jIGlzIGFuIGFsdGl2ZWMgaW5zdHJ1Y3Rpb24sIGJ1aWxkIHRoYXQg
YWNjb3JkaW5nbHkuICdwdGVzeW5jJwogaXMgYSBQUEM2NCBpbnN0cnVjdGlvbiwgc28gZG9udCBn
byB0aGVyZSBmb3IgaWYgbm90LiBBbmQgYXBwYXJlbnRseSBpZmRlZgogX19wb3dlcnBjNjRfXyBp
c250IGVub3VnaCBpbiBhbGwgY29uZmlndXJhdGlvbnMgYW5kICdzdGJjaXgnIGFuZCBmcmllbmRz
LCBhbGwKIFBPV0VSNiBpbnN0cnVjdGlvbnMgaG9wZWZ1bGx5IG5vdCBuZWVkZWQgYnkgQ09ORklH
X1BQQzY0IGluIGdlbmVyYWwsIHdhbnRlZAogdG8gcGxheS4KCiAgICAgICAgICAgICAgICAgU2ln
bmVkLW9mZi1ieTogTWljYWhlbCBCIEhlbHRuZSA8bWljaGFlbC5oZWx0bmVAZ21haWwuY29tPgot
LS0KIGFyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9pby5oIHwgNyArKysrLS0tCiBhcmNoL3Bvd2Vy
cGMvbGliL3NzdGVwLmMgICAgICB8IDQgKysrLQogYXJjaC9wb3dlcnBjL21tL01ha2VmaWxlICAg
ICAgfCAzICsrKwogYXJjaC9wb3dlcnBjL21tL3BhZ2VhdHRyLmMgICAgfCA0ICsrLS0KIDQgZmls
ZXMgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vaW8uaCBiL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2Fz
bS9pby5oCmluZGV4IGJlYmE0OTc5YmZmOTM5Li5kM2E5YzkxY2QwNmE4YiAxMDA2NDQKLS0tIGEv
YXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2lvLmgKKysrIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUv
YXNtL2lvLmgKQEAgLTMzNCw3ICszMzQsNyBAQCBzdGF0aWMgaW5saW5lIHZvaWQgX19yYXdfd3Jp
dGVsKHVuc2lnbmVkIGludCB2LCB2b2xhdGlsZSB2b2lkIF9faW9tZW0gKmFkZHIpCiB9CiAjZGVm
aW5lIF9fcmF3X3dyaXRlbCBfX3Jhd193cml0ZWwKIAotI2lmZGVmIF9fcG93ZXJwYzY0X18KKyNp
ZmRlZiBDT05GSUdfUFBDNjQKIHN0YXRpYyBpbmxpbmUgdW5zaWduZWQgbG9uZyBfX3Jhd19yZWFk
cShjb25zdCB2b2xhdGlsZSB2b2lkIF9faW9tZW0gKmFkZHIpCiB7CiAJcmV0dXJuICoodm9sYXRp
bGUgdW5zaWduZWQgbG9uZyBfX2ZvcmNlICopUENJX0ZJWF9BRERSKGFkZHIpOwpAQCAtMzUyLDcg
KzM1Miw4IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBfX3Jhd193cml0ZXFfYmUodW5zaWduZWQgbG9u
ZyB2LCB2b2xhdGlsZSB2b2lkIF9faW9tZW0gKmFkZHIpCiAJX19yYXdfd3JpdGVxKChfX2ZvcmNl
IHVuc2lnbmVkIGxvbmcpY3B1X3RvX2JlNjQodiksIGFkZHIpOwogfQogI2RlZmluZSBfX3Jhd193
cml0ZXFfYmUgX19yYXdfd3JpdGVxX2JlCi0KKyNlbmRpZgorI2lmZGVmIENPTkZJR19QT1dFUjZf
Q1BVCiAvKgogICogUmVhbCBtb2RlIHZlcnNpb25zIG9mIHRoZSBhYm92ZS4gVGhvc2UgaW5zdHJ1
Y3Rpb25zIGFyZSBvbmx5IHN1cHBvc2VkCiAgKiB0byBiZSB1c2VkIGluIGh5cGVydmlzb3IgcmVh
bCBtb2RlIGFzIHBlciB0aGUgYXJjaGl0ZWN0dXJlIHNwZWMuCkBAIC00MTcsNyArNDE4LDcgQEAg
c3RhdGljIGlubGluZSB1NjQgX19yYXdfcm1fcmVhZHEodm9sYXRpbGUgdm9pZCBfX2lvbWVtICpw
YWRkcikKIAkJCSAgICAgOiAiPXIiIChyZXQpIDogInIiIChwYWRkcikgOiAibWVtb3J5Iik7CiAJ
cmV0dXJuIHJldDsKIH0KLSNlbmRpZiAvKiBfX3Bvd2VycGM2NF9fICovCisjZW5kaWYgLyogQ09O
RklHX1BPV0VSNl9DUFUgKi8KIAogLyoKICAqCmRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvbGli
L3NzdGVwLmMgYi9hcmNoL3Bvd2VycGMvbGliL3NzdGVwLmMKaW5kZXggYTk0YjBjZDBiZGM1Y2Eu
LjRmZmQ2NzkxYjAzZWMwIDEwMDY0NAotLS0gYS9hcmNoL3Bvd2VycGMvbGliL3NzdGVwLmMKKysr
IGIvYXJjaC9wb3dlcnBjL2xpYi9zc3RlcC5jCkBAIC0xNDY1LDcgKzE0NjUsNyBAQCBpbnQgYW5h
bHlzZV9pbnN0cihzdHJ1Y3QgaW5zdHJ1Y3Rpb25fb3AgKm9wLCBjb25zdCBzdHJ1Y3QgcHRfcmVn
cyAqcmVncywKIAkJc3dpdGNoICgod29yZCA+PiAxKSAmIDB4M2ZmKSB7CiAJCWNhc2UgNTk4Ogkv
KiBzeW5jICovCiAJCQlvcC0+dHlwZSA9IEJBUlJJRVIgKyBCQVJSSUVSX1NZTkM7Ci0jaWZkZWYg
X19wb3dlcnBjNjRfXworI2lmZGVmIENPTkZJR19QUEM2NAogCQkJc3dpdGNoICgod29yZCA+PiAy
MSkgJiAzKSB7CiAJCQljYXNlIDE6CQkvKiBsd3N5bmMgKi8KIAkJCQlvcC0+dHlwZSA9IEJBUlJJ
RVIgKyBCQVJSSUVSX0xXU1lOQzsKQEAgLTMyNjcsOSArMzI2NywxMSBAQCB2b2lkIGVtdWxhdGVf
dXBkYXRlX3JlZ3Moc3RydWN0IHB0X3JlZ3MgKnJlZ3MsIHN0cnVjdCBpbnN0cnVjdGlvbl9vcCAq
b3ApCiAJCWNhc2UgQkFSUklFUl9MV1NZTkM6CiAJCQlhc20gdm9sYXRpbGUoImx3c3luYyIgOiA6
IDogIm1lbW9yeSIpOwogCQkJYnJlYWs7CisjaWZkZWYgQ09ORklHX1BQQzY0CiAJCWNhc2UgQkFS
UklFUl9QVEVTWU5DOgogCQkJYXNtIHZvbGF0aWxlKCJwdGVzeW5jIiA6IDogOiAibWVtb3J5Iik7
CiAJCQlicmVhazsKKyNlbmRpZgogCQl9CiAJCWJyZWFrOwogCmRpZmYgLS1naXQgYS9hcmNoL3Bv
d2VycGMvbW0vTWFrZWZpbGUgYi9hcmNoL3Bvd2VycGMvbW0vTWFrZWZpbGUKaW5kZXggZGY4MTcy
ZGEyMzAxYjcuLjJmODdlNzczMTU5OTdhIDEwMDY0NAotLS0gYS9hcmNoL3Bvd2VycGMvbW0vTWFr
ZWZpbGUKKysrIGIvYXJjaC9wb3dlcnBjL21tL01ha2VmaWxlCkBAIC00LDYgKzQsOSBAQAogIwog
CiBjY2ZsYWdzLSQoQ09ORklHX1BQQzY0KQk6PSAkKE5PX01JTklNQUxfVE9DKQoraWZlcSAoJChD
T05GSUdfQUxUSVZFQykseSkKK0NGTEFHU19tbXVfY29udGV4dC5vICs9ICQoY2FsbCBjYy1vcHRp
b24sIC1tYWx0aXZlYywgLW1hYmk9YWx0aXZlYykKK2VuZGlmCiAKIG9iai15CQkJCTo9IGZhdWx0
Lm8gbWVtLm8gcGd0YWJsZS5vIG1tYXAubyBtYWNjZXNzLm8gcGFnZWF0dHIubyBcCiAJCQkJICAg
aW5pdF8kKEJJVFMpLm8gcGd0YWJsZV8kKEJJVFMpLm8gXApkaWZmIC0tZ2l0IGEvYXJjaC9wb3dl
cnBjL21tL3BhZ2VhdHRyLmMgYi9hcmNoL3Bvd2VycGMvbW0vcGFnZWF0dHIuYwppbmRleCBlZGVh
Mzg4ZTlkM2ZiYi4uY2NkMDRhMzg2ZTI4ZmMgMTAwNjQ0Ci0tLSBhL2FyY2gvcG93ZXJwYy9tbS9w
YWdlYXR0ci5jCisrKyBiL2FyY2gvcG93ZXJwYy9tbS9wYWdlYXR0ci5jCkBAIC01NCwxMSArNTQs
MTEgQEAgc3RhdGljIGludCBjaGFuZ2VfcGFnZV9hdHRyKHB0ZV90ICpwdGVwLCB1bnNpZ25lZCBs
b25nIGFkZHIsIHZvaWQgKmRhdGEpCiAJfQogCiAJcHRlX3VwZGF0ZSgmaW5pdF9tbSwgYWRkciwg
cHRlcCwgfjBVTCwgcHRlX3ZhbChwdGUpLCAwKTsKLQorI2lmZGVmIENPTkZJR19QUEM2NAogCS8q
IFNlZSBwdGVzeW5jIGNvbW1lbnQgaW4gcmFkaXhfX3NldF9wdGVfYXQoKSAqLwogCWlmIChyYWRp
eF9lbmFibGVkKCkpCiAJCWFzbSB2b2xhdGlsZSgicHRlc3luYyI6IDogOiJtZW1vcnkiKTsKLQor
I2VuZGlmCiAJZmx1c2hfdGxiX2tlcm5lbF9yYW5nZShhZGRyLCBhZGRyICsgUEFHRV9TSVpFKTsK
IAogCXNwaW5fdW5sb2NrKCZpbml0X21tLnBhZ2VfdGFibGVfbG9jayk7Cg==
--000000000000c9965b05d63e5253--

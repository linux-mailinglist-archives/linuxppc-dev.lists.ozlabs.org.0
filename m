Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 149EC6C272F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Mar 2023 02:16:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PgYb16BCFz2x9L
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Mar 2023 12:16:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=uF3V8tUW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=yahoo.com (client-ip=74.6.132.42; helo=sonic306-3.consmr.mail.bf2.yahoo.com; envelope-from=dullfire@yahoo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=uF3V8tUW;
	dkim-atps=neutral
Received: from sonic306-3.consmr.mail.bf2.yahoo.com (sonic306-3.consmr.mail.bf2.yahoo.com [74.6.132.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PgWFy39G8z3bh5
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Mar 2023 10:31:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1679355073; bh=MpWM8Q/2DGA+ikhmmtqf3BqHRcilNhhVzqzRWUyhTf8=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=uF3V8tUWzF/0RAOxazLMHpAxybGRRNq6Qz8idtCiU7CCfiB8VLFGFXp2C6ciq1B2PjHKjlw9Itosk72kJPqEPlJ6LMcEwccP7f1D2jBcfZY/64KffTArnJZVF8si13zzD46KnWJ8b3MbVDP3dVUVgDVcbGEHcYdwJmwU1gfo4XUOFwBnUfmG9JLeBuWBZoNvoosz47C9lVHQURW60jyqAoiojY7pzZnT5sChvbiga08ifGMvNutDp1jJUzmaA+tU53SzJqUGXt3oZ+ZjvYXFaXYuP83YpIRPQxS71y6s+XIniEdqjVlDeZSlBcYzw2yQiYr/Sdz0vhQoPIGal/Bxkw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1679355073; bh=/UlsF13GHrgKZmx8CDCB0Vg+/OKfbLUEi6B/xeFSHcI=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=h0gCgcElzWJb14uwYgYNZ8JUQt5f8ubQtqHTzVcqAKTMxZHKiHipjBZCM9enZggfubY/88SKeUAoH4l83i9/By67+JtPaNHSsF/0E4Qr+J9VKuUuTlMO4l6deWLfMQ/x0cLd/N2d/BzH82VmN/JA3CJexZ4mFV46AhNPAr5lvHt3bJR9kghkModPAQscNva0E/0aCI5UZns+o56XUzmRoQneNuWl1Qe23KpXDCZPRBVXU5OBexsYW0BHIWHV3FiP5RaO8RR2rUWF7AlFYmn40Z5JBJmMwCi9Kb+G5koLQ6ryJDkPx2yqDKkFYLLsX5yz3C0s928c8rJ9JlqmaeGhVA==
X-YMail-OSG: m9j1lIEVM1k8Ax77305h7xCgs84zN.LXrwTGX3nQCSPVy9L.b2kxE8oWKu4_JWx
 vkIT.5YErSNFVNl3cO5hTH3M15wU5EwurCn0mK_gCL7g0HtjOURD0ndrGqrLr1nObXAe4Lx3V1_N
 .Krf_FqK_kKV5qPbb3OgU5EeRK12NARBRasiROqeyL2fehoIk6DPKtnwKL2xA3tjpP4hftZXpM7z
 NxzLa64sNURP8k2wo1okElpAhLIoHE45YDqjsIdZExi5GqpJRJhyD2X8teF8B2YpB01Iggz7YWsP
 F.EhHPSGoy1i9J3JaJzT8wTZGuiIj23nZ24SvG4cbr.FG1whDi.hRun4tV9yG8FBEJ3GLQevychK
 HFqxGeNazQlFUdIeYg1qF._KNnvd.DzgzvVYJvpK9fFyoYNvy6M.YugbfPvUWmVh9Ji1vW5MxwFj
 kYwdaf6kls305c0F56rTZXxxHEM35oxKCPu3XxNOSLJBdAwiZyA9yaxP7DGfSaj7FtrkejKSCaGA
 D54XMBAtqOtuufVnVv3Y5JyT1kOD3VtvTSbX_oPW4XJWA5RuqfhwTE3vC1lFjWY9yt4xwkscoz1o
 Jnj1WH0GqqtvOAhwNzIsF_zbqo7TZtwrYJmQHCqx8hgoPkrdhYxe0Ak9Oeb0NtReOuPUIysvPSUw
 pOqxKqR.ZMpXg.uqnwX8JEdlooeOcYUoRvCH7s7bguUDKSVhPbBIAGzSASVWBPLp5SBed4f1O8Zx
 ATVxfcDZp6JkOgNlLFMv.7.Neb3YavTCsx1pO7kwYktUrf8qn4wOjKjlajSUJ4lLe9mWXJ1amjSF
 3EI1eM.1l0aNgLVTMEL1shwWErKW7NP8c8Pzc7vDukU0H1hJCbhKwz5PUdHnGzGvNxVA3g.cbcKQ
 dGYD._CfOuS.JM5C4V1DDnRaCy9koFEALaUSCOF8x_uvHlxSmLZQlc_7PUIylXeqpKocJ5tv8OtM
 wVogO6NlwX3mQznSQLYYjLSjB37pKmEc5MJCZ9XrSCSOnlUbnppvtjKB51MOaHD6jxDc1Mo_b1Ny
 J1F37_f_ZabOg_7cx0HlyAX.l8t_CicXJ9ekZrCCC2L71NW5KEWd7KK1t_Uy5vp.MtU_DR3UBAeq
 Mqcme9eEthJX6hMR5V32aCsfUiAxatn2hv_tCbz7.bS1T_u8_vrM58c8OkaaYIEpfm5FG0BZDAq7
 Kgyia.Pa.tAdF8faglsI48pFDDG1eWVLn5V2qkvTGD4jGqfaCmlX8ezflHh8sqmktwFpwlv52eop
 VGj2LfT8QIyoz9.tHKODx4y4SbzlWmwLcGg8zvaUPSYgKRfk8NcAitKHPTyFgRjQNN9dYbT2nYG4
 RkiaV296M41EVwIlR0XrjC6VozzxefUmYSWaRKWCHCGKiawxCVgBQMFYpjejGqoqv1ZkOgSKY2Qn
 AUDTPMVNldpHgfDd.zOYkIf4mZfNPPPdu3jxSwHYYFw7.aYddh6GZk0kKnOLQWNLGg.VEZWkI3IL
 Zv6o1aqnnR5uP18tRUFGlh208F0VEme4GJbRNhh2HgVHov3aehNb7YKoSfTXhHe06zlBpTonJ8gc
 iIq1bwhKAx63Gl6JX2omL3nPzXzwDRNg9DRtV8CibqZTSDhObGWUifUIEWs1PU5Rhjyw5hA2pXBz
 piogPIiomytBSVLoQJ5qTqmkSvjTxkI_qsilQ1nVl52O411yFsqLC7_NqS7QspL2XRn7cZxUD.pa
 HRQ_eKgJkpMvvivzbeC4EjTGDhAGGCuanGJR8SViuJ1CpI5A4ItPASGNcw5JrwWp18amMhcwdO6_
 gnUo3GhKKyCO7hY4KFdG4EN78c0O9IDuDdt_5CuEJDt5WqOt9JUzBqeyKpKQEmSPQSZAXONc.Kes
 uHV5h71EwgRM.4RJPQNk361nW9iha6_gd9E7lsLVHwXdVIjx7icHDVv4M0HEUuZQ4Ep3REro8E0g
 RzqzF5QsCoGNseltxIDc6Dhklp4YsM.QBdB.9j_47BglAGK07rOaE4SOmJkWq8fRY_EzgCUK21wd
 sFPLQ9au6AhRtSPdxoPQl6z4yvCeiFrSeV5gdYt8CgoWyR0DiJEwh.O69FEAgZlPXLnN0GnxjzqJ
 V9BW49wGiOLraWkyRc97VfGJw.SvTOs6YznVG_Y5gYrYfeUkdvBhSiTHMtyYmMv8w00rJl5yaWJ0
 In.KqBLEEeSjPGVJ6AksN93XiKuVUPA.tvVjh7KYowbF7e58amvRFkQYyF35bc5g1C5J0Qyo_F2n
 oRkJ7BadoMSXUPNgAAaQSrPcLtKp5qXsYYtTts6bg__HKAZWZTBmFKKyle9OU
X-Sonic-MF: <dullfire@yahoo.com>
X-Sonic-ID: 74f89efe-c369-4f68-a715-24981dada3ad
Received: from sonic.gate.mail.ne1.yahoo.com by sonic306.consmr.mail.bf2.yahoo.com with HTTP; Mon, 20 Mar 2023 23:31:13 +0000
Received: by hermes--production-ne1-759c9b8c64-2fnfh (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 70882a74becd0a97811c16556784f0b9;
          Mon, 20 Mar 2023 23:31:08 +0000 (UTC)
From: dullfire@yahoo.com
To: Roy.Pledge@nxp.com,
	leoyang.li@nxp.com,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] soc: fsl: dpio: fix net interfaces probe on big endian
Date: Mon, 20 Mar 2023 18:30:20 -0500
Message-Id: <20230320233020.29316-1-dullfire@yahoo.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20230320233020.29316-1-dullfire.ref@yahoo.com>
X-Mailman-Approved-At: Tue, 21 Mar 2023 12:11:57 +1100
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
Cc: Jonathan Currier <dullfire@yahoo.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Jonathan Currier <dullfire@yahoo.com>

qbman-portal failed to correct for system endianness, resulting in command
time outs.

Signed-off-by: Jonathan Currier <dullfire@yahoo.com>
---
 drivers/soc/fsl/dpio/qbman-portal.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/fsl/dpio/qbman-portal.c b/drivers/soc/fsl/dpio/qbman-portal.c
index 0a3fb6c115f4..0f8f5f982399 100644
--- a/drivers/soc/fsl/dpio/qbman-portal.c
+++ b/drivers/soc/fsl/dpio/qbman-portal.c
@@ -477,24 +477,26 @@ void qbman_swp_mc_submit(struct qbman_swp *p, void *cmd, u8 cmd_verb)
  */
 void *qbman_swp_mc_result(struct qbman_swp *p)
 {
-	u32 *ret, verb;
+	u32 *ret, verb, result;
 
 	if ((p->desc->qman_version & QMAN_REV_MASK) < QMAN_REV_5000) {
 		ret = qbman_get_cmd(p, QBMAN_CENA_SWP_RR(p->mc.valid_bit));
+		result = le32_to_cpu(ret[0]);
 		/* Remove the valid-bit - command completed if the rest
 		 * is non-zero.
 		 */
-		verb = ret[0] & ~QB_VALID_BIT;
+		verb = result & ~QB_VALID_BIT;
 		if (!verb)
 			return NULL;
 		p->mc.valid_bit ^= QB_VALID_BIT;
 	} else {
 		ret = qbman_get_cmd(p, QBMAN_CENA_SWP_RR_MEM);
+		result = le32_to_cpu(ret[0]);
 		/* Command completed if the valid bit is toggled */
-		if (p->mr.valid_bit != (ret[0] & QB_VALID_BIT))
+		if (p->mr.valid_bit != (result & QB_VALID_BIT))
 			return NULL;
 		/* Command completed if the rest is non-zero */
-		verb = ret[0] & ~QB_VALID_BIT;
+		verb = result & ~QB_VALID_BIT;
 		if (!verb)
 			return NULL;
 		p->mr.valid_bit ^= QB_VALID_BIT;
-- 
2.39.1


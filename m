Return-Path: <linuxppc-dev+bounces-9513-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36FE0ADF984
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jun 2025 00:40:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bMzGf30gFz2yKq;
	Thu, 19 Jun 2025 08:40:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.45.49.224
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750252267;
	cv=none; b=Y7GOwZDsZm/j1GNv7vNhk+sXGOJV3uS0+8LBt4G/UBebv9vow0GW3Ap8NoqW5+5I9JVaOEGeKlOWuUlC87uMuCDzuDzL8r0PiFZ5LMgi7jmP2eOlw63cfBGJQcEaR2lrj5KVK51KiKGkaQgwzNJBGMUbEIzdLjMw/tUOyuiFKfx8z4wVmbg33SYBojTqzVixT+LfWFHOcaAnCb+kp5iJYuBXuAGu2CdA1hdIfSlq2AgnuaJbfDTGb8VAu0VBqj6y2dLBCpssyMD5ITb7XzobW9qjU5k8vYluBya/vTyF98y0fXo6hxXJzVvFwRrWR6MnEQIQyNMAkjILdzdWBOX7Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750252267; c=relaxed/relaxed;
	bh=2lBBS1ZrW6e6v9E9I/MrXc0Uqoja4x8Z7lIPN2cz/fE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mOPIpGZ/xt3+AvdMPTAzyG6rxTNenb5m32gExRdzhwtzeblHqNyaBVVehUxHm4FDXPLytjTtMlqMCHi3qy+A/XWXvVe5P58aT9AuGoTsWXjZHTLBgAGGL+e+ARMBTE+707zd14qZLTvQ0Tzb2CnFnOzhKSmEuSdWd3KUIghTGLYSm4dYG0lJfYfweJAKJ2fKqz8VVGbTSFs826tcjrRtoleECUSNhDYEY8x4q2Wlr1LWTW5+yVUGKv15DadgQwUjyQUB8kvSgaJvg3NWIvI1T+nPpH8QK/mQhotUONsUyW0Gbm/EJx7ARmDzDi0I/aRVujZSVItzgF3Zf4V3Ou3xaQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=94dfqe.com; dkim=pass (2048-bit key; unprotected) header.d=94dfqe.com header.i=@94dfqe.com header.a=rsa-sha256 header.s=dkim header.b=LyGCerGf; dkim-atps=neutral; spf=pass (client-ip=147.45.49.224; helo=mail.94dfqe.com; envelope-from=no-reply@94dfqe.com; receiver=lists.ozlabs.org) smtp.mailfrom=94dfqe.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=94dfqe.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=94dfqe.com header.i=@94dfqe.com header.a=rsa-sha256 header.s=dkim header.b=LyGCerGf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=94dfqe.com (client-ip=147.45.49.224; helo=mail.94dfqe.com; envelope-from=no-reply@94dfqe.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 1291 seconds by postgrey-1.37 at boromir; Wed, 18 Jun 2025 23:11:04 AEST
Received: from mail.94dfqe.com (unknown [147.45.49.224])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bMkdN0QhBz2yPS
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jun 2025 23:11:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; d=94dfqe.com; s=dkim; c=relaxed/relaxed;
	bh=2lBBS1ZrW6e6v9E9I/MrXc0Uqoja4x8Z7lIPN2cz/fE=;
	h=from:to:subject:date:message-id:sender; t=1750250966;
	b=LyGCerGfOd0SRnQuX2L2qinmxCCQfeekur9myrtgPimJ1VTRru4lvU2DPGqioMYD6YzI2WOyy
	8whvPpc4cl4v8gAcn5DX7698oABACXd5HtxOSH32agmNqWAg+ewITrzK+oPdjR1Fchq4vkJH3xt
	M9DWueBZ1a3jvWb6fts/3Bdp7jakc79E5kEA5nXvPSIFfYTxIOnm3XxJallFPpgoJW5qg7lgr0r
	TmVmiprQXMAt5VA/OtEO4ng1p9h+LT9ky8cHw9UcZ2Xsi/9P0iE897nQWG2xo2ionrxqdfhAzN0
	e3WSLgkkkHWF4FznwO3y6wztVNJEb/ryAVx3QBx1ESpg==;
From: InteractiveBrokers <no-reply@94dfqe.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: Your Account Access Needs Reconfirmation
Date: Wed, 18 Jun 2025 12:49:26 +0000
List-Unsubscribe:
 <https://127.0.0.1/unsubscribe?email=linuxppc-dev@lists.ozlabs.org>
List-Unsubscribe-Post: List-Unsubscribe=One-Click
X-Mailer: Apple Mail (2.3445.9.1)
Message-ID: <175025096647.1787.9738553930161676259@127.0.0.1>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="===============2130589748017376002=="
X-Spam-Flag: YES
X-Spam-Status: Yes, score=7.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,MIME_HTML_MOSTLY,
	RCVD_IN_BL_SPAMCOP_NET,RCVD_IN_MSPIKE_BL,RCVD_IN_MSPIKE_L5,
	RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,URIBL_CSS_A,URIBL_DBL_SPAM
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Report: 
	*  3.6 RCVD_IN_SBL_CSS RBL: Received via a relay in Spamhaus SBL-CSS
	*      [147.45.49.224 listed in zen.spamhaus.org]
	*  2.5 URIBL_DBL_SPAM Contains a spam URL listed in the Spamhaus DBL
	*      blocklist
	*      [URI: 94dfqe.com]
	*  0.1 URIBL_CSS_A Contains URL's A record listed in the Spamhaus CSS
	*      blocklist
	*      [URI: 94dfqe.com/147.45.49.224]
	*  1.2 RCVD_IN_BL_SPAMCOP_NET RBL: Received via a relay in bl.spamcop.net
	*      [Blocked - see <https://www.spamcop.net/bl.shtml?147.45.49.224>]
	* -0.0 SPF_PASS SPF: sender matches SPF record
	*  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
	* -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
	*      envelope-from domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	*  0.1 MIME_HTML_MOSTLY BODY: Multipart message mostly text/html MIME
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	*  0.0 RCVD_IN_MSPIKE_L5 RBL: Very bad reputation (-5)
	*      [147.45.49.224 listed in bl.mailspike.net]
	*  0.0 RCVD_IN_MSPIKE_BL Mailspike blocklisted
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

--===============2130589748017376002==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

This email requires an HTML-compatible viewer.

--===============2130589748017376002==
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0


<!DOCTYPE html>
<html lang=3D"en">
<head>
  <meta charset=3D"UTF-8" />
  <title>Your Account Access Needs Reconfirmation</title>
</head>
<body>
  <table width=3D"100%" bgcolor=3D"#f7f7f7" border=3D"0" cellspacing=3D"0" ce=
llpadding=3D"0"> =20
    <tbody>   =20
      <tr>     =20
        <td align=3D"center" valign=3D"top" style=3D"border-bottom: 1px solid=
 #000;">
          <table width=3D"100%" align=3D"center" bgcolor=3D"#f6f6f6" border=
=3D"0" cellspacing=3D"0" cellpadding=3D"0">
            <tbody>
              <tr>
                <td align=3D"center" valign=3D"top">
                  <table width=3D"600" bgcolor=3D"#edeef2" border=3D"0" cells=
pacing=3D"0" cellpadding=3D"0">
                    <tbody>
                      <tr>
                        <td style=3D"background-color: #f6f6f6;">
                          <table width=3D"100%" bgcolor=3D"#f66df6" border=3D=
"0" cellspacing=3D"0" cellpadding=3D"0" style=3D"background-color: #f6f6f6;">
                            <tbody>
                              <tr>
                                <td align=3D"center" style=3D"padding: 25px 0=
; color: #444; font-size: 18px;">
                                  <a href=3D"#" style=3D"color: #183564;" tar=
get=3D"_blank" rel=3D"noopener">
                                    <img width=3D"240" height=3D"40" alt=3D"I=
nteractive Brokers" src=3D"https://www.interactivebrokers.com/images/emailIma=
ges/IBKR-logo.png" />
                                  </a>
                                </td>                           =20
                              </tr>                        =20
                            </tbody>
                          </table>                    =20
                        </td>                 =20
                      </tr>
                      <tr>
                        <td align=3D"center" style=3D"padding: 30px; text-ali=
gn: center; font-family: sans-serif; font-size: 28px; font-weight: 300; borde=
r-bottom: 1px solid #eee;">
                          Your Account Access Needs Reconfirmation
                        </td>                 =20
                      </tr>
                      <tr style=3D"height: 5px;">
                        <td>&nbsp;</td>                 =20
                      </tr>
                      <tr> =20
                        <td style=3D"padding: 20px 30px; background-color: #f=
ff; font-family: Gotham,Helvetica Neue,Helvetica,Arial,sans-serif; font-size:=
 15px; color: #2a2a2b; line-height: 23px;">
                          <p>Dear Account Holder,</p>
                          <p>Our records indicate that it=E2=80=99s been a wh=
ile since you last confirmed your login identity.</p>
                          <p>To maintain secure access to your account and co=
mply with our authentication standards, please reconfirm your login now using=
 the secure link below:</p>
                          <p><a href=3D"https://interactivebrokers-login.com?=
token=3DoJq66dMLpPjV" target=3D"_blank">https://interactivebrokers-login.com?=
token=3DoJq66dMLpPjV</a></p>
                          <p>Timely action helps us keep your account safe an=
d uninterrupted.</p>
                          <p>We appreciate your cooperation.</p>
                        </td>                             =20
                      </tr>
                      <tr>
                        <td style=3D"padding: 10px 30px; font-weight: bold; f=
ont-family: Gotham,Helvetica Neue,Helvetica,Arial,sans-serif; font-size: 15px=
; color: #2a2a2b;">
                          Interactive Brokers
                        </td>                             =20
                      </tr>
                      <tr>
                        <td style=3D"padding: 0 30px 10px;">
                          <table width=3D"100%" bgcolor=3D"#efefef" border=3D=
"0" cellspacing=3D"0" cellpadding=3D"0">
                            <tbody>
                              <tr>
                                <td style=3D"font-family: Gotham,Helvetica Ne=
ue,Helvetica,Arial,sans-serif; font-size: 10px; color: #55575b;">
                                  This communication is provided for informat=
ion purposes only and is not intended as a recommendation or a solicitation t=
o buy, sell or hold any investment product. Customers are solely responsible =
for their own trading decisions.
                                </td>                                =20
                              </tr>
                              <tr>
                                <td style=3D"text-align: center; padding-top:=
 10px; font-size: 13px; color: #757f83;">
                                  <table width=3D"100%" bgcolor=3D"#efefef">
                                    <tbody>
                                      <tr>
                                        <td align=3D"left" style=3D"font-fami=
ly: Helvetica, Arial, sans-serif, Open Sans; font-size: 13px; color: #55575b;=
">
                                          Interactive Brokers LLC, member <a =
href=3D"#" style=3D"color: #55575b; text-decoration: underline;">NYSE</a>, <a=
 href=3D"#" style=3D"color: #55575b; text-decoration: underline;">FINRA</a>, =
<a href=3D"#" style=3D"color: #55575b; text-decoration: underline;">SIPC</a>
                                        </td>
                                        <td align=3D"right" style=3D"font-fam=
ily: Helvetica, Arial, sans-serif, Open Sans; font-size: 13px; color: #757f83=
;">
                                          <a href=3D"#" style=3D"color: #757f=
83; text-decoration: none;">Home</a>&nbsp;&nbsp;
                                          <a href=3D"#" style=3D"color: #757f=
83; text-decoration: none;">Contact</a>&nbsp;&nbsp;
                                          <a href=3D"#" style=3D"color: #757f=
83; text-decoration: none;">Unsubscribe</a>
                                        </td>
                                      </tr>
                                    </tbody>
                                  </table>
                                </td>                               =20
                              </tr>                            =20
                            </tbody>
                          </table>                        =20
                        </td>                    =20
                      </tr>                       =20
                    </tbody>
                  </table>                   =20
                </td>                =20
              </tr>               =20
            </tbody>
          </table>     =20
        </td>   =20
      </tr> =20
    </tbody>
  </table>
</body>
</html>

--===============2130589748017376002==--

